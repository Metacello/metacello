github/bitbucket support
downloadJSONIfModified: url eTagInfo: eTagInfo username: username pass: pass onError: errorBlock
  "return result of parsing JSON downloaded from url. username:pass may be nil, but calls will be subject to severe rate limits."

  "To minimize GitHub rate limiting problems, we are caching the ETags for the tag request: https://developer.github.com/v3/#conditional-requests"

  | jsonFileName errorFileName jsonFile eTagsUrl |
  jsonFileName := self tempFileFor: 'tagsIM-' , self processPID suffix: 'json'.
  eTagsUrl := url , ' -H "If-Modified-Since: ' , (eTagInfo at: 'Last-Modified')
    , '"'.
  errorFileName := self
    downloadBasicFile: eTagsUrl
    to: jsonFileName
    includeHTTPHeader: true
    username: username
    pass: pass.
  jsonFile := ServerFileDirectory on: jsonFileName.
  jsonFile containingDirectory
    readOnlyFileNamed: jsonFile localName
    do: [ :fileStream | 
      [ 
      self
        extractHTTPHeader: (ReadStream on: fileStream contents)
        do: [ :headerDict :payload | 
          | status |
          status := headerDict at: 'status'.
          (status beginsWith: '200')
            ifTrue: [ 
              | jsonObject |
              "Last-Modified date changed"
              jsonObject := MCFileTreeJsonParser parse: payload.
              eTagInfo
                at: 'Last-Modified' put: (headerDict at: 'Last-Modified');
                at: 'jsonObject' put: jsonObject;
                at: 'X-RateLimit-Remaining'
                  put: (headerDict at: 'X-RateLimit-Remaining');
                yourself.
              self deleteFileNamed: errorFileName.
              ^ jsonObject ].
          (status beginsWith: '304')
            ifTrue: [ 
              "eTagCache hit ... need to know if data still valid"
              eTagInfo
                at: 'X-RateLimit-Remaining'
                put: (headerDict at: 'X-RateLimit-Remaining').
              self deleteFileNamed: errorFileName.
              ^ eTagInfo at: 'jsonObject' ].
          (status beginsWith: '403')
            ifTrue: [ 
              | jsonObject |
              "Oh snap! Rate limit exceeded"
              jsonObject := MCFileTreeJsonParser parse: payload.
              self error: (jsonObject at: 'message') ].
          self
            error: 'Unexpected JSON tag request STATUS: ' , status printString ] ]
        on: Error
        do: [ :ex | errorBlock value: ex value: errorFileName ] ]