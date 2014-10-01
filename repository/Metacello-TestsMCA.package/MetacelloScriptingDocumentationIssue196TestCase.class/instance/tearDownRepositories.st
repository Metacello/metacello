running
tearDownRepositories
  super tearDownRepositories.
  alternateDirectory exists
    ifTrue: [ MetacelloPlatform current recursiveDelete: alternateDirectory ].
  Smalltalk removeKey: #'Metacello_Configuration_Test_Repository' ifAbsent: [  ].
  MCRepositoryGroup default
    removeRepository: externalRepository;
    removeRepository: alternateRepository;
    removeRepository: sampleRepository