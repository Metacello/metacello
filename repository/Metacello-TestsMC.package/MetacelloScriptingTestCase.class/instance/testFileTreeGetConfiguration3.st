tests
testFileTreeGetConfiguration3
    "trigger download of BaselineOf"

    | project versionSpec |
    project := Metacello new
        project: 'ExternalXX';
        repository: 'filetree://' , configurationDirectory fullName;
        get.
    versionSpec := (project version: '0.9') versionSpec