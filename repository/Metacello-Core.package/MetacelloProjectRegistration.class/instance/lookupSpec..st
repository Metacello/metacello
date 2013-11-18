lookup
lookupSpec: aProjectSpec
	^ self projectSpec
		ifNotNilDo: [ :spec | 
			spec baseName = aProjectSpec baseName
				ifTrue: [ spec ]
				ifFalse: [ nil ] ]