running
setUpRepositories
	| defaultDirectory |
	super setUpRepositories.
	defaultDirectory := MetacelloPlatform current defaultDirectory.
	configurationDirectory := MetacelloPlatform current directoryFromPath: self configurationPath relativeTo: defaultDirectory.
	externalDirectory := MetacelloPlatform current directoryFromPath: self externalPath relativeTo: defaultDirectory.
	sampleDirectory := MetacelloPlatform current directoryFromPath: self samplePath relativeTo: defaultDirectory.
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
	Smalltalk at: #Metacello_Configuration_Test_Repository put: externalRepository.
	monticelloRepository := MetacelloMonticelloResource current monticelloRepository.
	Smalltalk at: #Metacello_Gofer_Test_Repository put: monticelloRepository.
	mczConfigurationRepository := MetacelloConfigurationResource current monticelloRepository.
	Smalltalk at: #Metacello_MczConfiguration_Test_Repository put: mczConfigurationRepository