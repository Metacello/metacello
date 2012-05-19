tests
testFileTreeGetConfigurationVersionSpecXX
    "resolve to BaselineOf ... use spec or versionSpec"

    | project versionSpec expected |
    project := Metacello new
        project: 'ExternalXX';
        repository: 'filetree://' , configurationDirectory fullName;
        get.
    versionSpec := (project version: '0.9') versionSpec.
    expected := 'spec blessing: #''development''.
spec description: ''MetacelloScriptingResource>>versionOfXX:''.
spec author: ''dkh''.
spec timestamp: ''5/4/2012 14:16''.
spec baseline: ''External'' with: [
		spec
			versionString: ''957492f31b77026d81dcb165c07c69b2ad897781'';
			repository: ''github://dalehenrich/external/repository'' ].'.
    self assert: versionSpec printString = expected