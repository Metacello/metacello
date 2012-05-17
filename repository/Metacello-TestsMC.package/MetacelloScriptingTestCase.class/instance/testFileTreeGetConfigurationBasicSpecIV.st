tests
testFileTreeGetConfigurationBasicSpecIV
    "avoid resolving to BaselineOf .... use basicSpec"

    | project basicSpec expected |
    project := Metacello new
        project: 'ExternalIV';
        repository: 'filetree://' , configurationDirectory fullName;
        get.
    basicSpec := (project version: '0.9') basicSpec.
    expected := 'spec blessing: #''development''.
spec description: ''initial work''.
spec author: ''dkh''.
spec timestamp: ''5/4/2012 14:16''.
spec project: ''ExternalX'' with: [
		spec
			className: ''BaselineOfExternalX'';
			repository: ''dictionary://Metacello_Configuration_Test_Repository'' ].'.
    self assert: basicSpec printString = expected