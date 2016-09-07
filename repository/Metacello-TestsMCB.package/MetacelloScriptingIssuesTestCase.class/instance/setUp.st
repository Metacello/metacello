running
setUp
	super setUp.
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Configuration_Test_POST_DoIt_Result
		ifAbsent: [  ].
	MetacelloPlatform current
		removeGlobalNamed: #Metacello_Configuration_Test_DoIt_Result
		ifAbsent: [  ]