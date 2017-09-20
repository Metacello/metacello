running
tearDownRepositories
    super tearDownRepositories.
    Smalltalk globals removeKey: #'Metacello_Conflict_Test_Repository' ifAbsent: [  ]