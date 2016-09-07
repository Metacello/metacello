running
tearDownRepositories
	super tearDownRepositories.
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Configuration_Test_Repository
		ifAbsent: [  ].
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Gofer_Test_Repository
		ifAbsent: [  ].
	MCRepositoryGroup default
		removeIdenticalRepository: monticelloRepository;
		removeIdenticalRepository: configurationRepository