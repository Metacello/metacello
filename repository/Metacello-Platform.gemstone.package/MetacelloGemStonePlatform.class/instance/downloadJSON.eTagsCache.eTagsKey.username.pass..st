github/bitbucket support
downloadJSON: url eTagsCache: eTagsCache eTagsKey: eTagsKey username: username pass: pass
  "return result of parsing JSON downloaded from url. username:pass may be nil, but calls will be subject to severe rate limits."

  "To minimize GitHub rate limiting problems, we are caching the ETags for the tag request: https://developer.github.com/v3/#conditional-requests"

  | jsonFileName errorFileName jsonFile eTagsUrl eTagInfo errorBlock |
  jsonFileName := self tempFileFor: 'tags-' , self processPID suffix: '.json'.
  eTagsUrl := url.
  eTagsCache
    ifNotNil: [ 
      eTagsCache
        at: eTagsKey
        ifPresent: [ :info | 
          | etag |
          etag := info at: 'ETag' ifAbsent: [ '1234' ].
          eTagsUrl := eTagsUrl , ' -H ''If-None-Match: ' , etag , ''''.
          eTagInfo := info ]
        ifAbsent: [ 
          eTagInfo := Dictionary new.
          eTagsCache at: eTagsKey put: eTagInfo ] ].
  errorFileName := self
    downloadBasicFile: eTagsUrl
    to: jsonFileName
    includeHTTPHeader: eTagsCache notNil
    username: username
    pass: pass.
  errorBlock := [ :ex :curlErrorFileName | 
  | dir curlErrorString |
  dir := ServerFileDirectory on: curlErrorFileName.
  (dir fileExists: curlErrorFileName)
    ifTrue: [ 
      dir
        readOnlyFileNamed: curlErrorFileName
        do: [ :fileStream | 
          curlErrorString := '. Error could have been caused by: '
            , fileStream contents printString ] ]
    ifFalse: [ curlErrorString := '.' ].
  self
    error:
      'Error during download: ' , ex description printString , curlErrorString ].
  jsonFile := ServerFileDirectory on: jsonFileName.
  jsonFile containingDirectory
    readOnlyFileNamed: jsonFile localName
    do: [ :fileStream | 
      [ 
      eTagsCache
        ifNil: [ ^ MCFileTreeJsonParser parse: fileStream contents ]
        ifNotNil: [ 
          self
            extractHTTPHeader: (ReadStream on: fileStream contents)
            do: [ :headerDict :payload | 
              | status |
              status := headerDict at: 'status'.
              (status beginsWith: '200')
                ifTrue: [ 
                  | jsonObject |
                  "cached info is not valid"
                  jsonObject := MCFileTreeJsonParser parse: payload.
                  eTagInfo
                    at: 'ETag'
                      put: (headerDict at: 'ETag' ifAbsent: [ '1234' ]);
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
                  ^ self
                    downloadJSONIfModified: url
                    eTagInfo: eTagInfo
                    username: username
                    pass: pass
                    onError: errorBlock ].
              (status beginsWith: '403')
                ifTrue: [ 
                  | jsonObject |
                  "Oh snap! Rate limit exceeded"
                  jsonObject := MCFileTreeJsonParser parse: payload.
                  self error: (jsonObject at: 'message') ].
              self
                error:
                  'Unexpected JSON tag request STATUS: ' , status printString ] ] ]
        on: Error
        do: [ :ex | errorBlock value: ex value: errorFileName ] ]