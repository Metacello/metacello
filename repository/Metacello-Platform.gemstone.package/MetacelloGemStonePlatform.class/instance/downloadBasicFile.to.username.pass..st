git-based http repo support
downloadBasicFile: url to: outputFileName username: username pass: pass
  "download from <url> into <outputFileName>"

  | errorFileName auth |
  "Make a unique name for the error log and ensure that we can write the files"
  errorFileName := self downloadErrorFileNameFor: outputFileName.
  (ServerFileDirectory on: outputFileName) forceNewFileNamed: outputFileName.
  (ServerFileDirectory on: errorFileName) forceNewFileNamed: errorFileName.
  auth := username ifNotNil: [ ' -u ' , username , ':' , pass ] ifNil: [ '' ].
  System
    performOnServer:
      '/usr/bin/curl' , auth , ' -L ' , url , ' > ' , outputFileName , ' 2> '
        , errorFileName.
  ^ errorFileName