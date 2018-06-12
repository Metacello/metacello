*Metacello-Core
isAvailableFor: type
	^ self = MCHttpRepository and: [ type = 'http' ]