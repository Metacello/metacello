tests
testIssue332ParsingHeader3
  "https://github.com/dalehenrich/metacello-work/issues/332"

  | platform stream |
  platform := MetacelloPlatform current.
  stream := ReadStream on: self issue332Response3.
  platform
    extractHTTPHeader: stream
    do: [ :headerDict :payload | 
      | tagNames |
      self assert: (headerDict at: 'status') = '304 Not Modified'.
      self assert: (headerDict at: 'ETag' ifAbsent: [  ]) isNil.
      self
        assert:
          (headerDict at: 'Last-Modified') = 'Sat, 14 Feb 2015 21:49:04 GMT'.
      self assert: payload trimBoth isEmpty ]