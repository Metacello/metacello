tests
testFileTreeGet
	true
		ifTrue: [ 
			"under construction: need to add metacello.json file"
			^ self ].
	Metacello new
		project: 'External';
		repository: 'filetree://' , externalDirectory fullName;
		get