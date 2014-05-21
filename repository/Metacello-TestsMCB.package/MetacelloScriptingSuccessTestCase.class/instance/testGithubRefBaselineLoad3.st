tests
testGithubRefBaselineLoad3
	"loading 'Core' and 'Tests' groups using project:copyFrom:with:"

	self loadExternalFromDirectoryForBaseline: 'GithubRefXIII'.
	self
		validateExpectedConfigurationClassName: nil
		expectedConfigurationVersion: nil
		expectedConfigurationRepository: nil
		expectedBaselineClassName: 'BaselineOfGithubRefXIII'
		expectedBaselineVersion: 'baseline'
		expectedBaselineRepository: 'filetree://' , externalDirectory fullName.
	self
		verify: 'External-Core'
		loadedFrom: 'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository'.
	self
		verify: 'External-Tests'
		loadedFrom: 'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository'.
	self
		validateExpectedConfigurationClassName: nil
		expectedConfigurationVersion: nil
		expectedConfigurationRepository: nil
		expectedBaselineClassName: 'BaselineOfExternal'
		expectedBaselineVersion: 'baseline'
		expectedBaselineRepository:
			'github://dalehenrich/external:' , MetacelloScriptingResource externalCustomSHA , '/repository'