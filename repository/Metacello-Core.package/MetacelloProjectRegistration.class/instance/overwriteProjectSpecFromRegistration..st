accessing
overwriteProjectSpecFromRegistration: aProjectRegistration
	aProjectRegistration configurationProjectSpec
		ifNotNilDo: [ :aSpec | 
			configurationProjectSpec := aSpec.
			baselineProjectSpec := nil ]
		ifNil: [ 
			baselineProjectSpec := aProjectRegistration baselineProjectSpec.
			configurationProjectSpec := nil ]