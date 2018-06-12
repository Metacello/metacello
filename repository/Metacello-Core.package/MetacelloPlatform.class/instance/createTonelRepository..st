repository creation
createTonelRepository: aRepositorySpec
	| cl description headerSize |
	
	cl := Smalltalk at: #'TonelRepository'.
	description := aRepositorySpec description.
	headerSize := (aRepositorySpec type, '://') size.
 	^ cl new 
		directory: (self fileHandleOn: (aRepositorySpec description 
			copyFrom: headerSize + 1 
			to: description size));
		yourself