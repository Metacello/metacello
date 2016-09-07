tests project spec
testGithubRefXI
	"project:copyFrom:with:"

	| version expected repo |
	repo := MetacelloScriptingResource current externalRepository.
	MetacelloPlatform current
		metacelloLoadPackages: {'BaselineOfGithubRefXI'}
		from: {repo}.
	version := (MetacelloPlatform current
		globalNamed: #BaselineOfGithubRefXI) project version.
	expected := 'spec description: ''MetacelloScriptingResource>>configurationGithubReferenceV:''.
spec 
	project: ''External'' with: [
		spec
			className: ''ConfigurationOfExternal'';
			versionString: ''0.9.0'';
			loads: #(''Core'' );
			repository: ''github://dalehenrich/external:'
		, MetacelloScriptingResource externalConfigurationSHA
		,
			'/repository'' ];
	project: ''External Tests'' copyFrom: ''External'' with: [
		spec loads: #(''Tests'' ) ].'.
	self assert: version versionSpec printString = expected