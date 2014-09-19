github support
extractRepositoryFrom: zipFile to: directory
  "unzip <zipFile> into <directory>"

  | errorMessage pid zipErrorFileName |
  pid := self processPID.
  (ServerFileDirectory on: directory) assureExistence.
  zipErrorFileName := 'github-' , pid , '-zip.err'.
  (ServerFileDirectory on: '/tmp') deleteFileNamed: zipErrorFileName.
  System
    performOnServer:
      '/usr/bin/unzip -u ' , zipFile , ' -d ' , directory , ' 2> /tmp/'
        , zipErrorFileName.
  (ServerFileDirectory on: '/tmp')
    readOnlyFileNamed: zipErrorFileName
    do: [ :fileStream | 
      (errorMessage := fileStream contentsOfEntireFile) notEmpty
        ifTrue: [ self error: 'unzip failure: ' , errorMessage printString ]
        ifFalse: [ 
          (ServerFileDirectory on: '/tmp')
            deleteFileNamed: zipFile;
            deleteFileNamed: zipErrorFileName ] ]