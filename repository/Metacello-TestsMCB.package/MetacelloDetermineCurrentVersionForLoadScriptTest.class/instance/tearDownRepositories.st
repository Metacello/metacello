running
tearDownRepositories
  super tearDownRepositories.
  Smalltalk globals removeKey: #'Metacello_Configuration_Test_Repository' ifAbsent: [  ].
  Smalltalk globals removeKey: #'Metacello_Gofer_Test_Repository' ifAbsent: [  ].
  MCRepositoryGroup default
    removeIdenticalRepository: monticelloRepository;
    removeIdenticalRepository: configurationRepository