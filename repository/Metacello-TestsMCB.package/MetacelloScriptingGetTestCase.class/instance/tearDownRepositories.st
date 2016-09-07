running
tearDownRepositories
	super tearDownRepositories.
	MCRepositoryGroup default
		removeIdenticalRepository: (Smalltalk at: #Metacello_XXX_Test_Repository ifAbsent: [  ]).
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Config_Test_Repository
		ifAbsent: [  ].
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_XXX_Test_Repository
		ifAbsent: [  ]