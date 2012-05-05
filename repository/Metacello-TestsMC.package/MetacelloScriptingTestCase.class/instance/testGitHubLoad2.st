tests
testGitHubLoad2
	| loaded |
	true
		ifTrue: [ 
			"under construction: need to add metacello.json file"
			^ self ].
	Metacello new
		project: 'Sample';
		repository: 'github://dalehenrich/sample:1.0-beta.32Tests/core';
		load.
	loaded := Metacello loadedProjects.
	self assert: loaded size = 2.
	self assert: ((loaded at: 'External') at: 2) = 'master'.
	self assert: ((loaded at: 'Sample') at: 2) = '1.0-beta.32Tests'