running
tearDown
	| aGofer |
	super tearDown.
	aGofer := Gofer new.
	(self hasPackage: 'MetacelloTestConfigurationOfProjectIssue136')
		ifTrue: [ aGofer package: 'MetacelloTestConfigurationOfProjectIssue136' ].
	aGofer references notEmpty ifTrue: [ aGofer metacelloUnload ].
	Smalltalk removeKey: #'Metacello_Gofer_Test_Repository' ifAbsent: [].
	Smalltalk removeKey: #'Metacello_Configuration_Test_Repository' ifAbsent: [].
