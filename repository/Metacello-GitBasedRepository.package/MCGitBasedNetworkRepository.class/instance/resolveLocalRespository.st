private
resolveLocalRespository
	| directory directoryPath |
  
	directory := self calculateRepositoryDirectory.
	directoryPath := MCFileTreeFileUtils current directoryPathString: directory.
	directory exists ifFalse: [ 
		self error: 'Local directory ', directoryPath, ' does not exist.' ].
	localRepository := MetacelloPlatform current createRepository: (MetacelloRepositorySpec new 
		description: 'filetree://', directoryPath;
		yourself)