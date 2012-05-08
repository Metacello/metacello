tests
testFileTreeGetConfiguration1
    | project versionSpec expected |
    project := Metacello new
        project: 'ExternalX';
        repository: 'filetree://' , configurationDirectory fullName;
        get.
    versionSpec := (project version: '0.9') versionSpec.
    self assert: (versionSpec repositorySpecs first description endsWith: self configurationPath).
    versionSpec repositories: nil.	"full path to disk-based repository varies from platform to platform"
    expected := 'spec 
	baseline: ''External'' with: ''dictionary://Metacello_Configuration_Test_Repository''.'.
    self assert: versionSpec printString = expected