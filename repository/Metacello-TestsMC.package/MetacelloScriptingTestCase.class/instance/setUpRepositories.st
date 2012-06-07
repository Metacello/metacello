running
setUpRepositories
    super setUpRepositories.
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
    configurationRepository := MetacelloScriptingResource current configurationRepository.
    externalRepository := MetacelloScriptingResource current externalRepository.
    Smalltalk at: #'Metacello_Configuration_Test_Repository' put: externalRepository.
    monticelloRepository := MetacelloMonticelloResource current monticelloRepository.
    Smalltalk at: #'Metacello_Gofer_Test_Repository' put: monticelloRepository.
    mczConfigurationRepository := MetacelloConfigurationResource current monticelloRepository.
    Smalltalk at: #'Metacello_MczConfiguration_Test_Repository' put: mczConfigurationRepository