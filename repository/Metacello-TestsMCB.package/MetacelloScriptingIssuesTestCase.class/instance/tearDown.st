running
tearDown
	super tearDown.
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Configuration_Test_POST_DoIt_Result
		ifAbsent: [  ].
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Configuration_Test_DoIt_Result
		ifAbsent: [  ].
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_External_Test_Repository
		ifAbsent: [  ]