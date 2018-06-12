repository creation
createGithubRepository: aRepositorySpec
	| cl |
	
	cl := Smalltalk at: #'MCGitHubRepository'.
	^ cl location: aRepositorySpec description