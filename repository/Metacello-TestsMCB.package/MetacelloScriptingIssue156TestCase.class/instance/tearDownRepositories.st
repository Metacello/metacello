as yet unclassified
tearDownRepositories
  super tearDownRepositories.
  MCRepositoryGroup default
    removeIdenticalRepository:
      (Smalltalk at: #'Metacello_MczConfiguration_Test_Repository' ifAbsent: [  ]).
  Smalltalk
    removeKey: #'Metacello_MczConfiguration_Test_Repository'
    ifAbsent: [  ]