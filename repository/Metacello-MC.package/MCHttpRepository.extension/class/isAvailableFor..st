*Metacello-MC
isAvailableFor: type
	^ self = MCHttpRepository and: [ type = 'http' ]