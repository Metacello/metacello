tests
testFileTreeGetConfiguration2
    | project versionSpec expected |
    project := Metacello new
        project: 'ExternalXX';
        repository: 'filetree://' , configurationDirectory fullName;
        get.
    versionSpec := (project version: '0.9') versionSpec.
    expected := 'spec 
	baseline: ''External'' with: ''dictionary://Metacello_Configuration_Test_Repository''.'.
    self assert: versionSpec printString = expected