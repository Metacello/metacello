running
tearDown
    | aGofer |
    super tearDown.
    aGofer := Gofer new.
    self tearDownPackages: aGofer.
    aGofer references notEmpty
        ifTrue: [ aGofer metacelloUnload ].
    externalDirectory exists
        ifTrue: [ externalDirectory recursiveDelete ].
    sampleDirectory exists
        ifTrue: [ sampleDirectory recursiveDelete ].
    MetacelloScriptEngine loadedProjects: loadedProjectsCache.
    Smalltalk removeKey: #'Metacello_Gofer_Test_Repository' ifAbsent: [  ].
    Smalltalk removeKey: #'Metacello_Configuration_Test_Repository' ifAbsent: [  ].
    MCRepositoryGroup default
        removeRepository: monticelloRepository;
        removeRepository: configurationRepository