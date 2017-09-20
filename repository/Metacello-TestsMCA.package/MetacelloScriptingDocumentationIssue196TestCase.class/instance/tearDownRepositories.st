running
tearDownRepositories
  super tearDownRepositories.
  alternateDirectory exists
    ifTrue: [ MetacelloPlatform current recursiveDelete: alternateDirectory ].
  Smalltalk globals removeKey: #'Metacello_Configuration_Test_Repository' ifAbsent: [  ].
  MCRepositoryGroup default
    removeIdenticalRepository: externalRepository;
    removeIdenticalRepository: alternateRepository;
    removeIdenticalRepository: sampleRepository