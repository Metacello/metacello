running
setUp
    | externalRepo sampleRepo repo versionInfo |
    super setUp.
    externalDirectory := FileDirectory default directoryNamed: self externalPath.
    sampleDirectory := FileDirectory default directoryNamed: self samplePath.
    externalDirectory exists
        ifTrue: [ externalDirectory recursiveDelete ].
    externalDirectory assureExistence.
    sampleDirectory exists
        ifTrue: [ sampleDirectory recursiveDelete ].
    sampleDirectory assureExistence.
    externalRepo := MCFileTreeRepository new directory: externalDirectory.
    repo := MetacelloScriptingResource current externalRepository.
    versionInfo := repo versionInfoFromVersionNamed: 'External-Core-dkh.1'.
    externalRepo storeVersion: (repo versionWithInfo: versionInfo ifAbsent: [ self assert: false ]).
    sampleRepo := MCFileTreeRepository new directory: sampleDirectory.
    repo := MetacelloScriptingResource current sampleRepository.
    versionInfo := repo versionInfoFromVersionNamed: 'Sample-Core-dkh.1'.
    sampleRepo storeVersion: (repo versionWithInfo: versionInfo ifAbsent: [ self assert: false ]).
    loadedProjectsCache := MetacelloScriptEngine loadedProjects.
    MetacelloScriptEngine resetLoadedProjects.
    monticelloRepository := MetacelloMonticelloResource current monticelloRepository.
    Smalltalk at: #'Metacello_Gofer_Test_Repository' put: monticelloRepository.
    configurationRepository := MetacelloConfigurationResource current monticelloRepository.
    Smalltalk at: #'Metacello_Configuration_Test_Repository' put: configurationRepository