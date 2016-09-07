running
tearDownRepositories
	super tearDownRepositories.
	alternateDirectory exists
		ifTrue: [ MetacelloPlatform current recursiveDelete: alternateDirectory ].
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Configuration_Test_Repository
		ifAbsent: [  ].
	MetacelloPlatform current
		cleanUpRepositoryGroupRemoving: externalRepository;
		cleanUpRepositoryGroupRemoving: alternateRepository;
		cleanUpRepositoryGroupRemoving: sampleRepository