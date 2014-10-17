running
tearDownRepositories
  super tearDownRepositories.
  MCRepositoryGroup default
    removeRepository:
        (Smalltalk at: #'Metacello_Cache_Test_Repository' ifAbsent: [  ]);
    removeRepository:
        (Smalltalk at: #'Metacello_NewCache_Test_Repository' ifAbsent: [  ]);
    removeRepository:
        (Smalltalk at: #'Metacello_OverrideCache_Test_Repository' ifAbsent: [  ]);
    yourself.
  Smalltalk removeKey: #'Metacello_Configuration_Test_Repository' ifAbsent: [  ].
  Smalltalk removeKey: #'Metacello_Gofer_Test_Repository' ifAbsent: [  ].
  Smalltalk removeKey: #'Metacello_Cache_Test_Repository' ifAbsent: [  ].
  Smalltalk removeKey: #'Metacello_NewCache_Test_Repository' ifAbsent: [  ].
  Smalltalk removeKey: #'Metacello_OverrideCache_Test_Repository' ifAbsent: [  ].
  MCRepositoryGroup default
    removeRepository: monticelloRepository;
    removeRepository: configurationRepository