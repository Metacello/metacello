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
				directory: (FileDirectory on: (description copyFrom: headerSize to: description size))].
	type = 'serverDirectory'
		ifTrue: [
			headerSize := 'server://' size.
			description := aRepositorySpec description.
			^ MCServerDirectoryRepository new
				directory: (ServerFileDirectory on: (description copyFrom: headerSize to: description size))].
	^ super createRepository: aRepositorySpec