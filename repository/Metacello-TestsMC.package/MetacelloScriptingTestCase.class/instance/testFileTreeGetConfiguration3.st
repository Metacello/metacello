tests
testFileTreeGetConfiguration3
    | project versionSpec expected |
    self setHaltOnce.
    project := Metacello new
        project: 'ExternalX';
        repository: 'filetree://' , configurationDirectory fullName;
        get.
    versionSpec := (project version: '0.9') versionSpec.
    expected := 'spec blessing: #''development''.
spec description: ''initial work''.
spec author: ''dkh''.
spec timestamp: ''5/4/2012 14:16''.
spec repository: ''dictionary://Metacello_Custon_Configuration_Test_Repository''.'.
    self assert: versionSpec printString = expected