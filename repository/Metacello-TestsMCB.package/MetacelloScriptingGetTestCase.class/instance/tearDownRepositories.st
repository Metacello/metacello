running
tearDownRepositories
  super tearDownRepositories.
  Smalltalk removeKey: #'Metacello_Config_Test_Repository' ifAbsent: [  ].
  Smalltalk removeKey: #'Metacello_XXX_Test_Repository' ifAbsent: [  ].
  MCRepositoryGroup default
    removeRepository:
      (Smalltalk at: #'Metacello_XXX_Test_Repository' ifAbsent: [  ])