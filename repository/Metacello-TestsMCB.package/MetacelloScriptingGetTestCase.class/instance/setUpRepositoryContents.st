running
setUpRepositoryContents
	super setUpRepositoryContents.
	MetacelloPlatform current
		globalNamed: #Metacello_Config_Test_Repository
		put: configurationRepository