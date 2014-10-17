github/bitbucket support
downloadJSON: url username: username pass: pass
  "return result of parsing JSON downloaded from url. username:pass may be nil, but calls will be subject to severe rate limits."

  | jsonFileName jsonFile |
  jsonFileName := self tempFileFor: 'tags-' , self processPID suffix: 'json'.
  self
    downloadBasicFile: url
    to: jsonFileName
    username: username
    pass: pass.
  jsonFile := self fileHandleOn: jsonFileName.
  jsonFile parent
    readOnlyFileNamed: jsonFile basename
    do: [ :fileStream | ^ MCFileTreeJsonParser parseStream: fileStream ]
