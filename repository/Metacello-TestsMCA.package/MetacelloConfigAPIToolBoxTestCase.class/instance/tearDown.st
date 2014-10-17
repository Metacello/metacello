running
tearDown
  | aGofer |
  super tearDown.
  aGofer := Gofer new.
  (self hasPackage: 'MetacelloTestConfigurationOfProjectToolBox')
    ifTrue: [ aGofer package: 'MetacelloTestConfigurationOfProjectToolBox' ].
  (self hasPackage: 'MetacelloTestConfigurationOfProjectIssue115')
    ifTrue: [ aGofer package: 'MetacelloTestConfigurationOfProjectIssue115' ].
  aGofer references notEmpty
    ifTrue: [ aGofer metacelloUnload ].
  MCRepositoryGroup default
    removeRepository:
        (Smalltalk at: #'Metacello_Gofer_Test_Repository' ifAbsent: [  ]);
    removeRepository:
        (Smalltalk at: #'Metacello_Configuration_Test_Repository' ifAbsent: [  ]);
    yourself.
  Smalltalk removeKey: #'Metacello_Gofer_Test_Repository' ifAbsent: [  ].
  Smalltalk removeKey: #'Metacello_Configuration_Test_Repository' ifAbsent: [  ].
  Smalltalk
    removeKey: #'Metacello_Configuration_Test_DoIt_Result'
    ifAbsent: [  ].
  Smalltalk
    removeKey: #'Metacello_Configuration_Test_POST_DoIt_Result'
    ifAbsent: [  ]