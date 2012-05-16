running
setUp
    | configurationRepo externalRepo sampleRepo repo versionInfo |
    super setUp.
    configurationDirectory := FileDirectory default directoryNamed: self configurationPath.
    externalDirectory := FileDirectory default directoryNamed: self externalPath.
    sampleDirectory := FileDirectory default directoryNamed: self samplePath.
    configurationDirectory exists
        ifTrue: [ configurationDirectory recursiveDelete ].
    configurationDirectory assureExistence.
    externalDirectory exists
        ifTrue: [ externalDirectory recursiveDelete ].
    externalDirectory assureExistence.
    sampleDirectory exists
        ifTrue: [ sampleDirectory recursiveDelete ].
    sampleDirectory assureExistence.
    configurationRepo := MCFileTreeRepository new directory: configurationDirectory.
    repo := MetacelloScriptingResource current configurationRepository.
    versionInfo := repo versionInfoFromVersionNamed: 'ConfigurationOfExternalX-dkh.1'.
    configurationRepo storeVersion: (repo versionWithInfo: versionInfo ifAbsent: [ self assert: false ]).
    versionInfo := repo versionInfoFromVersionNamed: 'ConfigurationOfExternalXX-dkh.1'.
    configurationRepo storeVersion: (repo versionWithInfo: versionInfo ifAbsent: [ self assert: false ]).
    externalRepo := MCFileTreeRepository new directory: externalDirectory.
    repo := MetacelloScriptingResource current externalRepository.
    #('External-CoreX-dkh.1' 'BaselineOfExternalX-dkh.1' 'BaselineOfGithubRefX-dkh.1' 'BaselineOfGithubRefXX-dkh.1' 'BaselineOfGithubRefXXX-dkh.1' 'BaselineOfGithubRefIV-dkh.1' 'BaselineOfGithubRefV-dkh.1')
        do: [ :package | 
            versionInfo := repo versionInfoFromVersionNamed: package.
            externalRepo storeVersion: (repo versionWithInfo: versionInfo ifAbsent: [ self assert: false ]) ].
    sampleRepo := MCFileTreeRepository new directory: sampleDirectory.
    repo := MetacelloScriptingResource current sampleRepository.
    versionInfo := repo versionInfoFromVersionNamed: 'Sample-CoreX-dkh.1'.
    sampleRepo storeVersion: (repo versionWithInfo: versionInfo ifAbsent: [ self assert: false ]).
    loadedProjectsCache := MetacelloScriptEngine loadedProjects.
    MetacelloScriptEngine resetLoadedProjects.
    configurationRepository := MetacelloScriptingResource current externalRepository.
    Smalltalk at: #'Metacello_Configuration_Test_Repository' put: configurationRepository.
    monticelloRepository := MetacelloMonticelloResource current monticelloRepository.
    Smalltalk at: #'Metacello_Gofer_Test_Repository' put: monticelloRepository.
    mczConfigurationRepository := MetacelloConfigurationResource current monticelloRepository.
    Smalltalk at: #'Metacello_MczConfiguration_Test_Repository' put: mczConfigurationRepository