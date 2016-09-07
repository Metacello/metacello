running
tearDownRepositories
	super tearDownRepositories.
	MCRepositoryGroup default
		removeIdenticalRepository: (Smalltalk at: #Metacello_Cache_Test_Repository ifAbsent: [  ]);
		removeIdenticalRepository: (Smalltalk at: #Metacello_NewCache_Test_Repository ifAbsent: [  ]);
		removeIdenticalRepository:
			(Smalltalk at: #Metacello_OverrideCache_Test_Repository ifAbsent: [  ]);
		yourself.
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Configuration_Test_Repository
		ifAbsent: [  ].
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Gofer_Test_Repository
		ifAbsent: [  ].
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Cache_Test_Repository
		ifAbsent: [  ].
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_NewCache_Test_Repository
		ifAbsent: [  ].
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_OverrideCache_Test_Repository
		ifAbsent: [  ].
	MCRepositoryGroup default
		removeIdenticalRepository: monticelloRepository;
		removeIdenticalRepository: configurationRepository