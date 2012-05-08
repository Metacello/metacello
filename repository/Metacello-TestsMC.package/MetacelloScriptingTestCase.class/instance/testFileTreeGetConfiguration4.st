tests
testFileTreeGetConfiguration4
    | project versionSpec expected |
    project := Metacello new
        project: 'ExternalXX';
        repository: 'filetree://' , configurationDirectory fullName;
        get.
    versionSpec := (project version: '0.9') versionSpec.
    expected := 'spec blessing: #''development''.
spec description: ''initial work''.
spec author: ''dkh''.
spec timestamp: ''5/4/2012 14:16''.
spec repository: ''github://dalehenrich/external:5f5c3b9435de497f1ed92b553728ec2ec67530ca/repository''.'.
    self assert: versionSpec printString = expected