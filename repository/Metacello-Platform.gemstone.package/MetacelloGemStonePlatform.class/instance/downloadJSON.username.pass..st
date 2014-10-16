github/bitbucket support
downloadJSON: url username: username pass: pass
  "return result of parsing JSON downloaded from url. username:pass may be nil, but calls will be subject to severe rate limits."

  | jsonFileName errorFileName jsonFile |
  jsonFileName := self tempFileFor: 'tags-' , self processPID suffix: 'json'.
  errorFileName := self
    downloadBasicFile: url
    to: jsonFileName
    username: username
    pass: pass.
  jsonFile := ServerFileDirectory on: jsonFileName.
  jsonFile containingDirectory
    readOnlyFileNamed: jsonFile localName
    do: [ :fileStream | 
      | stream |
      stream := RWBinaryOrTextStream on: fileStream contents.
      [ ^ MCFileTreeJsonParser parseStream: stream ]
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
              'Error during download: ' , ex description printString , curlErrorString ] ]