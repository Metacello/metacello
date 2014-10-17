running
tearDown
  super tearDown.
  MCRepositoryGroup default
    removeRepository:
      (Smalltalk at: #'Metacello_Project_Test_Repository' ifAbsent: [  ]).
  Smalltalk removeKey: #'Metacello_Project_Test_Repository' ifAbsent: [  ]