running
tearDownRepositories
	super tearDownRepositories.
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Conflict_Test_Repository
		ifAbsent: [  ]