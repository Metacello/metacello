accessing
tearDownRepositories
	super tearDownRepositories.
	MCRepositoryGroup default
		removeIdenticalRepository:
			(Smalltalk
				at: #Metacello_MczConfiguration_Test_Repository
				ifAbsent: [  ]).
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_MczConfiguration_Test_Repository
		ifAbsent: [  ]