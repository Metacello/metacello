running
tearDown
	super tearDown.
	Smalltalk globals removeKey: #'Metacello_Configuration_Test_DoIt_Result' ifAbsent: [].
	MetacelloConfigurationResource projectAttributes: nil.