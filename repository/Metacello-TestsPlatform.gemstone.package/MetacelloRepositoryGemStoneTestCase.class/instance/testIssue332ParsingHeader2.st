tests
testIssue332ParsingHeader2
  "https://github.com/dalehenrich/metacello-work/issues/332"

  | platform stream |
  platform := MetacelloPlatform current.
  stream := ReadStream on: self issue332Response2.
  platform
    extractHTTPHeader: stream
    do: [ :headerDict :payload | 
      | tagNames |
      self assert: (headerDict at: 'Status') = '304 Not Modified'.
      self
        assert: (headerDict at: 'ETag') = '"d1531b98e97e99e1ae6cc503149ae9f4"'.
      self
        assert:
          (headerDict at: 'Last-Modified') = 'Sat, 14 Feb 2015 21:49:04 GMT'.
      self assert: payload trimBoth isEmpty ]