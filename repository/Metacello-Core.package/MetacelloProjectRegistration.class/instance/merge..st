accessing
merge: aProjectRegistration
	" ... merge is done when a spec has been loaded into the image"

	self shouldBeMutable.
	aProjectRegistration validate.
	self validate.
	aProjectRegistration configurationProjectSpec
		ifNotNilDo: [ :aSpec | 
			configurationProjectSpec := aSpec.
			baselineProjectSpec := nil ]
		ifNil: [ 
			baselineProjectSpec := aProjectRegistration baselineProjectSpec.
			configurationProjectSpec := nil ]