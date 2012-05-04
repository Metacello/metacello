scripting
projectFrom: aScriptingEngine
	| configurationName repositorySpec repository |
	configurationName := MetacelloToolBox configurationNameFrom: aScriptingEngine projectName.
	repositorySpec := self new repositorySpec
		description: aScriptingEngine repositoryDescription;
		yourself.
	repository := repositorySpec createRepository.
	Gofer new
		repository: repository;
		package: configurationName;
		load.
	^ (Smalltalk at: configurationName asSymbol) project