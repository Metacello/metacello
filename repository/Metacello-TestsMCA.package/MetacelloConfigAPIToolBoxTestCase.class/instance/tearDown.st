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
    removeIdenticalRepository:
        (Metacello current
            globalNamed: #'Metacello_Gofer_Test_Repository'
            ifAbsent: [  ]);
    removeIdenticalRepository:
        (Metacello current
            globalNamed: #'Metacello_Configuration_Test_Repository'
            ifAbsent: [  ]);
    yourself.
  MetacelloPlatform current
    removeGlobalNamed: #'Metacello_Gofer_Test_Repository'
    ifAbsent: [  ].
  MetacelloPlatform current
    removeGlobalNamed: #'Metacello_Configuration_Test_Repository'
    ifAbsent: [  ].
  MetacelloPlatform current
    removeGlobalNamed: #'Metacello_Configuration_Test_DoIt_Result'
    ifAbsent: [  ].
  MetacelloPlatform current
    removeGlobalNamed: #'Metacello_Configuration_Test_POST_DoIt_Result'
    ifAbsent: [  ].
  MetacelloPlatform current reenableUndefinedSybolUpdates: undefinedSymbols