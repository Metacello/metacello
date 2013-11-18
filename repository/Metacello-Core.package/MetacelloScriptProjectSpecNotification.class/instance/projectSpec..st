accessing
projectSpec: anObject
	anObject isBaselineOfProjectSpec | anObject isConfigurationOfProjectSpec
		ifFalse: [ 0 halt ].
	projectSpec := anObject