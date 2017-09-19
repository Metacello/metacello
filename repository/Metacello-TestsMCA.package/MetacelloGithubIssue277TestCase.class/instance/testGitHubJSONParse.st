tests
testGitHubJSONParse
  "no error"
	
	Smalltalk 
		at: #MCFileTreeJsonParser 
		ifPresent: [ :c | ^ c parse: self githubTagsJSON ].
	
	Smalltalk 
		at: #STON
		ifPresent: [ :c | ^ c fromString: self githubTagsJSON ].
		
	self fail: 'No JSON parser found.'