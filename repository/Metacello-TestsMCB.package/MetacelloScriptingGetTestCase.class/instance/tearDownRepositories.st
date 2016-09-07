running
tearDownRepositories
	super tearDownRepositories.
	MetacelloPlatform current
		cleanUpRepositoryGroupRemoving:
			(MetacelloPlatform current
				globalNamed: #Metacello_XXX_Test_Repository
				ifAbsent: [  ]).
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Config_Test_Repository
		ifAbsent: [  ].
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_XXX_Test_Repository
		ifAbsent: [  ]