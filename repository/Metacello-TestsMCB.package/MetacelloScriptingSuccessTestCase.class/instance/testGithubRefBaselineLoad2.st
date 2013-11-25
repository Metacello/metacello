tests
testGithubRefBaselineLoad2
	"loading 'Core' and 'Tests' groups "

	self
		loadExternalFromDirectoryForBaseline: 'GithubRefXII';
		validateExpectedConfigurationClassName: nil
			expectedConfigurationVersion: nil
			expectedConfigurationRepository: nil
			expectedBaselineClassName: 'BaselineOfGithubRefXII'
			expectedBaselineVersion: 'baseline'
			expectedBaselineRepository: 'filetree://' , externalDirectory fullName;
		verify: 'External-Core'
			loadedFrom: 'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository';
		verify: 'External-Tests'
			loadedFrom: 'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository';
		validateExpectedConfigurationClassName: nil
			expectedConfigurationVersion: nil
			expectedConfigurationRepository: nil
			expectedBaselineClassName: 'BaselineOfExternal'
			expectedBaselineVersion: 'baseline'
			expectedBaselineRepository:
				'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository'