tests
testFileTreeLoadConfiguration
    | project |
    project := Metacello new
        project: 'ExternalX';
        version: '0.9';
        repository: 'filetree://' , configurationDirectory fullName;
        load