running
tearDownRepositories
  super tearDownRepositories.
  MCRepositoryGroup default
    removeIdenticalRepository:
        (Smalltalk globals at: #'Metacello_Cache_Test_Repository' ifAbsent: [  ]);
    removeIdenticalRepository:
        (Smalltalk globals at: #'Metacello_NewCache_Test_Repository' ifAbsent: [  ]);
    removeIdenticalRepository:
        (Smalltalk globals at: #'Metacello_OverrideCache_Test_Repository' ifAbsent: [  ]);
    yourself.
  Smalltalk globals removeKey: #'Metacello_Configuration_Test_Repository' ifAbsent: [  ].
  Smalltalk globals removeKey: #'Metacello_Gofer_Test_Repository' ifAbsent: [  ].
  Smalltalk globals removeKey: #'Metacello_Cache_Test_Repository' ifAbsent: [  ].
  Smalltalk globals removeKey: #'Metacello_NewCache_Test_Repository' ifAbsent: [  ].
  Smalltalk globals removeKey: #'Metacello_OverrideCache_Test_Repository' ifAbsent: [  ].
  MCRepositoryGroup default
    removeIdenticalRepository: monticelloRepository;
    removeIdenticalRepository: configurationRepository