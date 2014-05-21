accessing
merge: aProjectRegistration
	" ... merge is done when a spec has been loaded into the image"

	self shouldBeMutable.
	aProjectRegistration validate.
	projectName = aProjectRegistration projectName
		ifFalse: [ 
			Transcript
				cr;
				show:
						'Did not expect project name ' , projectName printString , ' to differ with merging project name '
								, aProjectRegistration projectName printString ].
	self overwriteProjectSpecFromRegistration: aProjectRegistration