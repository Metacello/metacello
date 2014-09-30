*metacello-gitorious
downloadTarFile: url to: outputFileName
  "download tar file from <url> into <outputFileName>"

  | errorFileName |
  errorFileName := self downloadBasicFile: url to: outputFileName.
  [ 
  | ans |
  "verify tar file before getting the heck out of dodge"
  ans := System performOnServer: 'tar -ztf ' , outputFileName.
  (ans includesSubString: 'Child returned status')
    ifTrue: [ self error: 'attempt to untar file failed: ' , ans ] ]
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
          'Error during download: ' , ex description printString , curlErrorString ]