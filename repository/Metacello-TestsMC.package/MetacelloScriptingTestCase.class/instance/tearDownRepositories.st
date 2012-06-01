running
tearDownRepositories
    configurationDirectory exists
        ifTrue: [ configurationDirectory recursiveDelete ].
    externalDirectory exists
        ifTrue: [ externalDirectory recursiveDelete ].
    sampleDirectory exists
        ifTrue: [ sampleDirectory recursiveDelete ].
    Smalltalk removeKey: #'Metacello_Configuration_Test_Repository' ifAbsent: [  ].
    Smalltalk removeKey: #'Metacello_Gofer_Test_Repository' ifAbsent: [  ].
    Smalltalk removeKey: #'Metacello_MczConfiguration_Test_Repository' ifAbsent: [  ].
    MCRepositoryGroup default
        removeRepository: externalRepository;
        removeRepository: monticelloRepository;
        removeRepository: mczConfigurationRepository;
        removeRepository: configurationRepository