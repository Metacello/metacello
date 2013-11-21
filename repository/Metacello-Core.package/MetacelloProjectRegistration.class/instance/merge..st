accessing
merge: aProjectRegistration
	" ... merge is done when a spec has been loaded into the image"

	self shouldBeMutable.
	aProjectRegistration validate.
	projectName = aProjectRegistration projectName
		ifFalse: [ 
			self
				error:
					'This should be unreachable as I cant see how we could have matched this registration without a projectName in the first place' ].
	self overwriteProjectSpecFromRegistration: aProjectRegistration