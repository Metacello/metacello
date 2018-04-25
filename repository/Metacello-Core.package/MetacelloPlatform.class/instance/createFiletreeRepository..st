repository creation
createFiletreeRepository: aRepositorySpec
	| cl description headerSize |
	
	cl := Smalltalk at: #'MCFileTreeRepository'.
	description := aRepositorySpec description.
 	headerSize := 'filetree://' size.
	^ cl new 
		directory: (self fileHandleOn: (aRepositorySpec description 
			copyFrom: headerSize + 1 
			to: description size));
		yourself