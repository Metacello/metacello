tests
testFileTreeGetConfiguration1
    | project versionSpec expected |
    project := Metacello new
        project: 'ExternalX';
        repository: 'filetree://' , configurationDirectory fullName;
        get.
    versionSpec := (project version: '0.9') versionSpec.
    self assert: (versionSpec repositorySpec description endsWith: self configurationPath).
    versionSpec repository: nil.	"full path to disk-based repository varies from platform to platform"
    expected := 'spec blessing: #''development''.
spec description: ''initial work''.
spec author: ''dkh''.
spec timestamp: ''5/4/2012 14:16''.'.
    self assert: versionSpec printString = expected