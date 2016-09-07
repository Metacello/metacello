running
tearDownRepositories
	super tearDownRepositories.
	MetacelloPlatform current
		cleanUpRepositoryGroupRemoving:
			(MetacelloPlatform current
				globalNamed: #Metacello_Cache_Test_Repository
				ifAbsent: [  ]);
		cleanUpRepositoryGroupRemoving:
			(MetacelloPlatform current
				globalNamed: #Metacello_NewCache_Test_Repository
				ifAbsent: [  ]);
		cleanUpRepositoryGroupRemoving:
			(MetacelloPlatform current
				globalNamed: #Metacello_OverrideCache_Test_Repository
				ifAbsent: [  ]);
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
	MetacelloPlatform current
		cleanUpRepositoryGroupRemoving: monticelloRepository;
		cleanUpRepositoryGroupRemoving: configurationRepository