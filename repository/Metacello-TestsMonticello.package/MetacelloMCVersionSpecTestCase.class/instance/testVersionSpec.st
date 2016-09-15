tests
testVersionSpec
  | version |
  version := self versionSpec
    blessing: #'baseline';
    versionString: '1.0';
    description: 'A description';
    author: 'dkh';
    timestamp: '1/24/2012 09:59';
    preLoadDoIt: #'preLoadDoIt';
    postLoadDoIt: #'postLoadDoIt';
    yourself.
  self assert: version blessing = #'baseline'.
  self assert: version versionString = '1.0'.
  self assert: version description = 'A description'.
  self assert: version author = 'dkh'.
  self assert: version timestamp = '1/24/2012 09:59'.
  self assert: version preLoadDoIt == #'preLoadDoIt'.
  self assert: version postLoadDoIt == #'postLoadDoIt'.
  self should: [ version preLoadDoIt: '' ] raise: Error.
  self should: [ version postLoadDoIt: '' ] raise: Error