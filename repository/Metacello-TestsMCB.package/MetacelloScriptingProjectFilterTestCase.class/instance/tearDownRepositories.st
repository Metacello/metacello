running
tearDownRepositories
    super tearDownRepositories.
    Smalltalk globals removeKey: #'Metacello_External_Test_Repository' ifAbsent: [  ]