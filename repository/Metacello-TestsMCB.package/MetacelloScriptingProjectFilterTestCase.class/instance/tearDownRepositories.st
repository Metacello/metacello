running
tearDownRepositories
	super tearDownRepositories.
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_External_Test_Repository
		ifAbsent: [  ]