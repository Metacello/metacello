repository creation
createHttpRepository: aRepositorySpec
	^ MCHttpRepository
        location: aRepositorySpec description
        user: aRepositorySpec username
        password: aRepositorySpec password
