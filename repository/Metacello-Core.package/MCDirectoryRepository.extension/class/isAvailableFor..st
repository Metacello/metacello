*Metacello-Core
isAvailableFor: type
	^ self = MCDirectoryRepository and: [ type = 'directory' ]