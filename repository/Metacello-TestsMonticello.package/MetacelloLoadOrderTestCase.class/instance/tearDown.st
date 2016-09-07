running
tearDown
	super tearDown.
	MetacelloPlatform current
		cleanUpRepositoryGroupRemoving: (Smalltalk at: #Metacello_Project_Test_Repository ifAbsent: [  ]).
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Project_Test_Repository
		ifAbsent: [  ]