git-based http repo support
downloadBasicFile: url to: outputFileName
  "download from <url> into <outputFileName>"

  | errorFileName |
  "Make a unique name for the error log and ensure that we can write the files"
  errorFileName := self downloadErrorFileNameFor: outputFileName.
  (ServerFileDirectory on: outputFileName) forceNewFileNamed: outputFileName.
  (ServerFileDirectory on: errorFileName) forceNewFileNamed: errorFileName.
  System
    performOnServer:
      '/usr/bin/curl -L ' , url , ' > ' , outputFileName , ' 2> ' , errorFileName.
  ^ errorFileName