repository creation
createDirectoryRepository: aRepositorySpec
	^ MCDirectoryRepository new
		directory: (self fileHandleOn: aRepositorySpec description);
		yourself