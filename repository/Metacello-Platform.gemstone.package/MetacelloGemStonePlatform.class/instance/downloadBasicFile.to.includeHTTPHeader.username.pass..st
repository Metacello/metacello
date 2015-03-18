git-based http repo support
downloadBasicFile: url to: outputFileName includeHTTPHeader: includeHTTPHeader username: username pass: pass
  "download from <url> into <outputFileName>"

  | errorFileName args |
  "Make a unique name for the error log and ensure that we can write the files"
  errorFileName := self downloadErrorFileNameFor: outputFileName.
  (ServerFileDirectory on: outputFileName) forceNewFileNamed: outputFileName.
  (ServerFileDirectory on: errorFileName) forceNewFileNamed: errorFileName.
  args := username ifNotNil: [ ' -u ' , username , ':' , pass ] ifNil: [ '' ].
  includeHTTPHeader
    ifTrue: [ args := args , ' -i ' ].
  System
    performOnServer:
      '/usr/bin/curl' , args , ' -L ' , url , ' > ' , outputFileName , ' 2> '
        , errorFileName.
  ^ errorFileName