running
tearDownRepositories
	super tearDownRepositories.
	alternateDirectory exists
		ifTrue: [ MetacelloPlatform current recursiveDelete: alternateDirectory ].
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Configuration_Test_Repository
		ifAbsent: [  ].
	MCRepositoryGroup default
		removeIdenticalRepository: externalRepository;
		removeIdenticalRepository: alternateRepository;
		removeIdenticalRepository: sampleRepository