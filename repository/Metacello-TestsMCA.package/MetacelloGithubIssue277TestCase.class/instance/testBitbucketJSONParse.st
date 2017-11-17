tests
testBitbucketJSONParse
  "no error"

	Smalltalk 
		at: #MCFileTreeJsonParser 
		ifPresent: [ :c | ^ c parse: self bitbucketTagsJSON ].
	
	Smalltalk 
		at: #STON
		ifPresent: [ :c | ^ c fromString: self bitbucketTagsJSON ].
		
	self fail: 'No JSON parser found.'