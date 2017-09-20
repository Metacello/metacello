running
tearDown
  super tearDown.
  MCRepositoryGroup default
    removeIdenticalRepository:
      (Smalltalk globals at: #'Metacello_Project_Test_Repository' ifAbsent: [  ]).
  Smalltalk globals removeKey: #'Metacello_Project_Test_Repository' ifAbsent: [  ]