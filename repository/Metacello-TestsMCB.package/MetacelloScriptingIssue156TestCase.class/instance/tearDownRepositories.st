as yet unclassified
tearDownRepositories
  super tearDownRepositories.
  MCRepositoryGroup default
    removeIdenticalRepository:
      (Smalltalk at: #'Metacello_MczConfiguration_Test_Repository' ifAbsent: [  ]).
  Smalltalk globals
    removeKey: #'Metacello_MczConfiguration_Test_Repository'
    ifAbsent: [  ]