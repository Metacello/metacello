github/bitbucket support
downloadFile: url to: outputFileName
  "download from <url> into <outputFileName>"

  | archive zipfile errorFileName stream |
  "Make a unique name for the error log and ensure that we can write the files"
  errorFileName := self downloadBasicFile: url to: outputFileName.
  archive := ZipArchive new.
  zipfile := ServerFileDirectory on: outputFileName.
  zipfile containingDirectory
    readOnlyFileNamed: zipfile localName
    do: [ :fileStream | stream := RWBinaryOrTextStream on: fileStream contents ].
  [ archive readFrom: stream ]
    on: Error
    do: [ :ex | 
      | dir curlErrorString |
      dir := ServerFileDirectory on: errorFileName.
      (dir fileExists: errorFileName)
        ifTrue: [ 
          dir
            readOnlyFileNamed: errorFileName
            do: [ :fileStream | 
              curlErrorString := '. Error could have been caused by: '
                , fileStream contents printString ] ]
        ifFalse: [ curlErrorString := '.' ].
      self
        error:
          'Error during download: ' , ex description printString , curlErrorString ].
  (ServerFileDirectory on: '/tmp') deleteFileNamed: errorFileName.
  ^ archive