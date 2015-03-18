github/bitbucket support
downloadJSON: url username: username pass: pass
  "return result of parsing JSON downloaded from url. username:pass may be nil, but calls will be subject to severe rate limits."

  ^ self
    downloadJSON: url
    eTagsCache: nil
    eTagsKey: nil
    username: username
    pass: pass