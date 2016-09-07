tests project spec
testGithubRefVI
	"configuration:with:"

	| version expected repo |
	repo := MetacelloScriptingResource current externalRepository.
	MetacelloPlatform current
		metacelloLoadPackages: {'BaselineOfGithubRefVI'}
		from: {repo}.
	version := (MetacelloPlatform current
		globalNamed: #BaselineOfGithubRefVI) project version.
	expected := 'spec description: ''MetacelloScriptingResource>>configurationGithubReferenceXXX:''.
spec configuration: ''External'' with: [
		spec
			versionString: ''0.9.0'';
			repository: ''http://ss3.gemtalksystems.com/ss/external'' ].'.
	self assert: version versionSpec printString = expected