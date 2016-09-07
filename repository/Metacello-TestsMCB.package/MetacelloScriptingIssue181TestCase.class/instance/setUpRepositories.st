running
setUpRepositories
	super setUpRepositories.
	MetacelloPlatform current
		globalNamed: #Metacello_Configuration_Test_Repository
		put: configurationRepository