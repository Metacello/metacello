*Metacello-Core
isAvailableFor: type
	^ self = MCFileTreeRepository and: [ type = 'filetree' ]