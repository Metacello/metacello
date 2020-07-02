github/bitbucket support
downloadJSON: url eTagsCache: eTagsCache eTagsKey: eTagsKey username: username pass: pass
  "Use ZnClient to manage https interactions"

  "To minimize GitHub rate limiting problems, we are caching the ETags for the tag request: https://developer.github.com/v3/#conditional-requests"

  "GsSecureSocket disableCertificateVerificationOnClient must be sent before using etags"

  | client header responseCode etagInfo jsonObject |
  client := ZnClient new
    systemPolicy;
    url: url;
    accept: ZnMimeType applicationJson;
    contentReader: [ :entity | entity ifNotNil: [ STON fromString: entity contents ] ];
    enforceHttpSuccess: false;
    yourself.
  etagInfo := eTagsCache
    at: eTagsKey
    ifPresent: [ :info | 
      | etag |
      etag := info at: 'ETag' ifAbsent: [  ].
      etag ifNotNil: [ client headerAt: 'If-None-Match' put: etag ].
      etagInfo := info ]
    ifAbsent: [ 
      etagInfo := Dictionary new.
      eTagsCache at: eTagsKey put: etagInfo ].
  jsonObject := client get.
  header := client response headers headers.
  responseCode := client response statusLine code.
  responseCode = 200
    ifTrue: [ 
      | tag |
      tag := header
        at: 'Etag'
        ifAbsent: [ self error: 'No Etag found for ' , url printString ].
      (tag beginsWith: 'W/')
        ifTrue: [ tag := tag copyFrom: 3 to: tag size ]
        ifFalse: [ tag := tag copyFrom: 1 to: tag size ].
      etagInfo
        at: 'ETag' put: tag;
        at: 'last-modified' put: (header at: 'Last-Modified');
        at: 'jsonObject' put: jsonObject;
        at: 'X-Ratelimit-Remaining' put: (header at: 'X-Ratelimit-Remaining');
        yourself.
      ^ jsonObject ].
  responseCode = 304
    ifTrue: [ 
      "etagCache hit"
      ^ etagInfo at: 'jsonObject' ].
  responseCode = 403
    ifTrue: [ 
      "Oh snap! Rate limit exceeded"
      self error: (jsonObject at: 'message') ].
  self
    error:
      'Unexpected responseCode ' , responseCode printString , ' for '
        , url printString