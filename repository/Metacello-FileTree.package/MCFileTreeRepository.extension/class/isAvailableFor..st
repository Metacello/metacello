*Metacello-FileTree
isAvailableFor: type
	^ self = MCFileTreeRepository and: [ type = 'filetree' ]