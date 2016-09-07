running
tearDownRepositories
	super tearDownRepositories.
	MetacelloPlatform current
		cleanUpRepositoryGroupRemoving: (Smalltalk at: #Metacello_XXX_Test_Repository ifAbsent: [  ]).
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Config_Test_Repository
		ifAbsent: [  ].
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_XXX_Test_Repository
		ifAbsent: [  ]