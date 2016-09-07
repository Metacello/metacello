tests project spec
testGithubRefXII
	"baseline:with: and className:"

	| version expected repo |
	repo := MetacelloScriptingResource current externalRepository.
	MetacelloPlatform current
		metacelloLoadPackages: {'BaselineOfGithubRefXII'}
		from: {repo}.
	version := (MetacelloPlatform current
		globalNamed: #BaselineOfGithubRefXII) project version.
	expected := 'spec description: ''MetacelloScriptingResource>>baselineGithubReferenceVI:''.
spec 
	baseline: ''External Core'' with: [
		spec
			className: ''BaselineOfExternal'';
			loads: #(''Core'' );
			repository: ''github://dalehenrich/external:1ac58502ade7814e1590f71d615cca434b1a4fd5/repository'' ];
	baseline: ''External Tests'' with: [
		spec
			className: ''BaselineOfExternal'';
			loads: #(''Tests'' );
			repository: ''github://dalehenrich/external:1ac58502ade7814e1590f71d615cca434b1a4fd5/repository'' ].'.
	self assert: version versionSpec printString = expected