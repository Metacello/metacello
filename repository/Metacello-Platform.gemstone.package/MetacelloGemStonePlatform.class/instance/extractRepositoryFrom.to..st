github support
extractRepositoryFrom: zipFile to: directory
  "unzip <zipFile> into <directory>"

  | errorMessage |
  (ServerFileDirectory on: directory) assureExistence.
  (ServerFileDirectory on: '/tmp') deleteFileNamed: 'zip.err'.
  System
    performOnServer:
      '/usr/bin/unzip -u ' , zipFile , ' -d ' , directory , ' 2> /tmp/zip.err'.
  (ServerFileDirectory on: '/tmp')
    fileNamed: 'zip.err'
    do: [ :fileStream | 
      (errorMessage := fileStream contentsOfEntireFile) notEmpty
        ifTrue: [ self error: 'unzip failure: ' , errorMessage printString ]
        ifFalse: [ 
          (ServerFileDirectory on: '/tmp')
            deleteFileNamed: zipFile;
            deleteFileNamed: (self downloadErrorFileNameFor: zipFile) ] ]