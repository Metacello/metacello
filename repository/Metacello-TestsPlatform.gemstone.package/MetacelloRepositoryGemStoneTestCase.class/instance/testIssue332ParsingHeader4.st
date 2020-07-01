tests
testIssue332ParsingHeader4
  "https://github.com/dalehenrich/metacello-work/issues/332"

  | platform stream |
  platform := MetacelloPlatform current.
  stream := ReadStream on: self issue332Response4.
  platform
    extractHTTPHeader: stream
    do: [ :headerDict :payload | 
      | tagNames |
      self assert: (headerDict at: 'status') = '200 OK'.
      self
        assert: (headerDict at: 'ETag') = '"d1531b98e97e99e1ae6cc503149ae9f4"'.
      self
        assert:
          (headerDict at: 'Last-Modified') = 'Sat, 14 Feb 2015 21:49:04 GMT'.
      tagNames := #('v1.0.6' 'v1.0.5' 'v1.0.4' 'v1.0.3' 'v1.0.2' 'v1.0.1' 'v1.0.0').
      (MCFileTreeJsonParser parse: payload)
        do: [ :tag | self assert: (tagNames includes: (tag at: 'name')) ] ]