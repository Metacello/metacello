running
tearDown
    | aGofer |
    super tearDown.
    aGofer := Gofer new.
    self tearDownPackages: aGofer.
    aGofer references notEmpty
        ifTrue: [ aGofer metacelloUnload ].
    configurationDirectory exists
        ifTrue: [ configurationDirectory recursiveDelete ].
    externalDirectory exists
        ifTrue: [ externalDirectory recursiveDelete ].
    sampleDirectory exists
        ifTrue: [ sampleDirectory recursiveDelete ].
    MetacelloProjectRegistration registry: loadedProjectsCache.
    Smalltalk removeKey: #'Metacello_Configuration_Test_Repository' ifAbsent: [  ].
    Smalltalk removeKey: #'Metacello_Gofer_Test_Repository' ifAbsent: [  ].
    Smalltalk removeKey: #'Metacello_MczConfiguration_Test_Repository' ifAbsent: [  ].
    MCRepositoryGroup default
        removeRepository: configurationRepository;
        removeRepository: monticelloRepository;
        removeRepository: mczConfigurationRepository