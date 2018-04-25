repository creation
createRepository: aRepositorySpec

	^ MCRepository 
		newRepositoryFromSpec: aRepositorySpec
		on: self