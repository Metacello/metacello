repository creation
createBitbucketRepository: aRepositorySpec
	| cl |
	
	cl := Smalltalk at: #'MCBitbucketRepository'.
 	^ cl location: aRepositorySpec description