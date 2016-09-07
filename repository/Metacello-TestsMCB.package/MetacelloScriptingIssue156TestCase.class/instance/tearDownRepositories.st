accessing
tearDownRepositories
	super tearDownRepositories.
	MetacelloPlatform current
		cleanUpRepositoryGroupRemoving:
			(MetacelloPlatform current
				globalNamed: #Metacello_MczConfiguration_Test_Repository
				ifAbsent: [  ]).
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_MczConfiguration_Test_Repository
		ifAbsent: [  ]