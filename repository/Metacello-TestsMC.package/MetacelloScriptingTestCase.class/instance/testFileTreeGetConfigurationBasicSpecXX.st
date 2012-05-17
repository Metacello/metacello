tests
testFileTreeGetConfigurationBasicSpecXX
    "avoid resolving to BaselineOf .... use basicSpec"

    | project basicSpec expected |
    project := Metacello new
        project: 'ExternalXX';
        repository: 'filetree://' , configurationDirectory fullName;
        get.
    basicSpec := (project version: '0.9') basicSpec.
    expected := 'spec blessing: #''development''.
spec description: ''initial work: first commit on custom branch''.
spec author: ''dkh''.
spec timestamp: ''5/4/2012 14:16''.
spec repository: ''github://dalehenrich/external:957492f31b77026d81dcb165c07c69b2ad897781/repository''.'.
    self assert: basicSpec printString = expected