running
setUpRepositories
	super setUpRepositories.
	monticelloRepository := MetacelloMonticelloResource current
		monticelloRepository.
	MetacelloPlatform current
		globalNamed: #Metacello_Gofer_Test_Repository
		put: monticelloRepository.
	configurationRepository := MetacelloConfigurationResource current
		monticelloRepository.
	MetacelloPlatform current
		globalNamed: #Metacello_Configuration_Test_Repository
		put: configurationRepository.
	MetacelloPlatform current
		globalNamed: #Metacello_Cache_Test_Repository
		put: MCDictionaryRepository new