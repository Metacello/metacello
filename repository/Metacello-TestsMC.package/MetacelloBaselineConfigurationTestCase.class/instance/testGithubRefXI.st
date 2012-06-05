tests
testGithubRefXI
    "project:copyFrom:with:"

    | version expected repo |
    repo := MetacelloScriptingResource current externalRepository.
    Gofer new
        repository: repo;
        package: 'BaselineOfGithubRefXI';
        load.
    version := (Smalltalk at: #'BaselineOfGithubRefXI') project version.
    expected := 'spec description: ''MetacelloScriptingResource>>configurationGithubReferenceV:''.
spec 
	configuration: ''External'' with: [
		spec
			versionString: ''0.9'';
			loads: #(''Core'' );
			repository: ''github://dalehenrich/external:' , MetacelloScriptingResource externalConfigurationSHA
        ,
            '/repository'' ];
	project: ''External Tests'' copyFrom: ''External'' with: [
		spec loads: #(''Tests'' ) ].'.
    self halt.
    self assert: version versionSpec printString = expected