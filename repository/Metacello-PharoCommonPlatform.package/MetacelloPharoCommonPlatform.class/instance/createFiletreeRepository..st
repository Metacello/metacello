repository creation
createFiletreeRepository: aRepositorySpec
	MCRepository 
		findFiletreeAlternateFormat: aRepositorySpec
		ifFound: [ :repository | 
			^ repository createRepositoryFromSpec: aRepositorySpec on: self ].

	^ super createFiletreeRepository: aRepositorySpec