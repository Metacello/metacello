running
tearDown
	super tearDown.
	MCRepositoryGroup default
		removeIdenticalRepository: (Smalltalk at: #Metacello_Project_Test_Repository ifAbsent: [  ]).
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Project_Test_Repository
		ifAbsent: [  ]