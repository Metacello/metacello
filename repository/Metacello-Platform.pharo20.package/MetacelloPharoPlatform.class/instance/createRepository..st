repository creation
createRepository: aRepositorySpec

	| type |
	type := aRepositorySpec type.
	type = 'ftp'
		ifTrue: [ | description headerSize index host directory |
			description := aRepositorySpec description.
			headerSize := 'ftp://' size.
			index := description indexOf: $/ startingAt: headerSize + 1.
			host := description copyFrom: headerSize + 1 to: index - 1.
			directory := description copyFrom: index + 1 to: description size.
			^ MCFtpRepository
				host: host 
				directory: directory 
				user: aRepositorySpec username
				password: aRepositorySpec password].
    type = 'directory'
        ifTrue: [ ^ MCDirectoryRepository new directory: (aRepositorySpec description asReference) ].
    Smalltalk
        at: #'MCFileTreeRepository'
        ifPresent: [ :cl | 
            type = 'filetree'
                ifTrue: [ 
                    | description headerSize |
                    description := aRepositorySpec description.
                    headerSize := 'filetree://' size.
                    ^ cl new
                        directory:
                            ( (aRepositorySpec description copyFrom: headerSize + 1 to: description size) asReference) ] ].
 	^ super createRepository: aRepositorySpec