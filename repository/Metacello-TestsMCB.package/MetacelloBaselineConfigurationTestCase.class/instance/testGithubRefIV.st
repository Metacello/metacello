tests project spec
testGithubRefIV
	"project:with:"

	| version expected repo |
	repo := MetacelloScriptingResource current externalRepository.
	MetacelloPlatform current
		metacelloLoadPackages: {'BaselineOfGithubRefIV'}
		from: {repo}.
	version := (MetacelloPlatform current
		globalNamed: #BaselineOfGithubRefIV) project version.
	expected := 'spec description: ''MetacelloScriptingResource>>configurationGithubReferenceX:''.
spec project: ''External'' with: [
		spec
			className: ''ConfigurationOfExternal'';
			versionString: ''0.9.0'';
			repository: ''github://dalehenrich/external:'
		, MetacelloScriptingResource externalConfigurationSHA
		, '/repository'' ].'.
	self assert: version versionSpec printString = expected