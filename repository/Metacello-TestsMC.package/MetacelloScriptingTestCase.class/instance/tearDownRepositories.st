running
tearDownRepositories
  super tearDownRepositories.
  configurationDirectory exists
    ifTrue: [ MetacelloPlatform current recursiveDelete: configurationDirectory ].
  externalDirectory exists
    ifTrue: [ MetacelloPlatform current recursiveDelete: externalDirectory ].
  sampleDirectory exists
    ifTrue: [ MetacelloPlatform current recursiveDelete: sampleDirectory ].
  MetacelloPlatform current
    removeGlobalNamed: #'Metacello_Configuration_Test_Repository'
    ifAbsent: [  ].
  MetacelloPlatform current
    removeGlobalNamed: #'Metacello_Gofer_Test_Repository'
    ifAbsent: [  ].
  MetacelloPlatform current
    removeGlobalNamed: #'Metacello_MczConfiguration_Test_Repository'
    ifAbsent: [  ].
  MetacelloPlatform current
    cleanUpRepositoryGroupRemoving: externalRepository;
    cleanUpRepositoryGroupRemoving: monticelloRepository;
    cleanUpRepositoryGroupRemoving: mczConfigurationRepository;
    cleanUpRepositoryGroupRemoving: configurationRepository