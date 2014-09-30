gitorious support
extractTarGzFrom: tarGzFile to: directoryName
  "tar -zxf into <directoryName>"

  | errorMessage pid tarGzOutputFileName |
  pid := self processPID.
  (ServerFileDirectory on: directoryName) assureExistence.
  tarGzOutputFileName := 'gitorious-' , pid , '-untar.out'.
  (ServerFileDirectory on: '/tmp') deleteFileNamed: tarGzOutputFileName.
  errorMessage := System
    performOnServer:
      'tar -zxf ' , tarGzFile , '-C ' , directoryName , ' > /tmp/'
        , tarGzOutputFileName.
  errorMessage notEmpty
    ifTrue: [ self error: 'tar -zxf failure: ' , errorMessage printString ]
    ifFalse: [ 
      (ServerFileDirectory on: '/tmp')
        deleteFileNamed: tarGzFile;
        deleteFileNamed: tarGzOutputFileName ]