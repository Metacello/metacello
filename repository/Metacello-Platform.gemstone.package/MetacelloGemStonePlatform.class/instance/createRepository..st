repository creation
createRepository: aRepositorySpec

	| type headerSize description |
	type := aRepositorySpec type.
	type = 'directory'
		ifTrue: [^ MCServerDirectoryRepository new
					directory: (ServerFileDirectory on: aRepositorySpec description)].
	type = 'clientDirectory'
		ifTrue: [
			headerSize := 'client://' size.
			description := aRepositorySpec description.
			^ MCDirectoryRepository new
				directory: (ClientFileDirectory on: (description copyFrom: headerSize + 1 to: description size))].
	type = 'serverDirectory'
		ifTrue: [
			headerSize := 'server://' size.
			description := aRepositorySpec description.
			^ MCServerDirectoryRepository new
				directory: (ServerFileDirectory on: (description copyFrom: headerSize + 1 to: description size))].
	^ super createRepository: aRepositorySpec