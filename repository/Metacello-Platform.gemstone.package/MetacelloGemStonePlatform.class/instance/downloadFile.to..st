github support
downloadFile: url to: outputFileName
  "download from <url> into <outputFileName>"

  | archive zipfile errorFileName stream |
  "Make a unique name for the error log and ensure that we can write the files"
  errorFileName := self downloadErrorFileNameFor: outputFileName.
  (ServerFileDirectory on: outputFileName) forceNewFileNamed: outputFileName.
  (ServerFileDirectory on: errorFileName) forceNewFileNamed: errorFileName.
  System
    performOnServer:
      '/usr/bin/curl -L ' , url , ' > ' , outputFileName , ' 2> ' , errorFileName.
  archive := ZipArchive new.
  zipfile := ServerFileDirectory on: outputFileName.
  zipfile containingDirectory
    readOnlyFileNamed: zipfile localName
    do: [ :fileStream | stream := RWBinaryOrTextStream on: fileStream contents ].
  [ archive readFrom: stream ]
    on: Error
    do: [ :ex | 
      (ServerFileDirectory on: '/tmp')
        deleteFileNamed: outputFileName;
        deleteFileNamed: (self downloadErrorFileNameFor: errorFileName).
      ex pass ].
  ^ archive