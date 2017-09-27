running
tearDown
	super tearDown.
	Smalltalk globals removeKey: #'Metacello_Atomic_Configuration_Test_Repository' ifAbsent: [].
	MetacelloConfigurationResource projectAttributes: nil