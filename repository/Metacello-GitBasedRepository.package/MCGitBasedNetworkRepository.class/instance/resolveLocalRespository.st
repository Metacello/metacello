private
resolveLocalRespository
	| platform directory |
  
	platform := MetacelloPlatform current.
	directory := self class
		projectDirectoryFrom: self projectPath
		version: self projectVersion.
 	self repoPath isEmpty ifFalse: [ 
		directory := platform
			directoryFromPath: self repoPath
			relativeTo: directory ].
 
	localRepository := platform createRepository: (MetacelloRepositorySpec new 
		description: 'filetree://', directory fullName;
		yourself)