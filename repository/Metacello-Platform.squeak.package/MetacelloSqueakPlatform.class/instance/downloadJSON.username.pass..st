github/bitbucket support
downloadJSON: url username: username pass: pass
  "return result of parsing JSON downloaded from url. username:pass may be nil, but calls will be subject to severe rate limits."

  | json |
  json := WebClient httpDo: [ :client | 
    username ifNotNil: [
      client 
        username: username;
        password: pass;
        yourself ].
    (client httpGet: url) content ].
  ^ MCFileTreeJsonParser parse: json
