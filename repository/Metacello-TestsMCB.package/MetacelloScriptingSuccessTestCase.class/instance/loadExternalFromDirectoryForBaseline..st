tests
loadExternalFromDirectoryForBaseline: baselineName
	Metacello new
		baseline: baselineName;
		repository: 'filetree://' , externalDirectory fullName;
		silently;
		onWarning: [ :ex | 
					(ex isKindOf: UndeclaredVariableWarning)
						ifFalse: [ 
							self
								assert: ex messageText
								equals: 'Did not expect project name ''External Core'' to differ with merging project name ''External Tests''' ].
					ex resume ];
		load: #('External Core' 'External Tests')