tests
loadExternalFromDirectoryForBaseline: baselineName
	Metacello new
		baseline: baselineName;
		repository: 'filetree://' , externalDirectory fullName;
		silently;
		onWarning: [ :ex | ex resume ];
		load: #('External Core' 'External Tests')