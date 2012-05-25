tests
testFileTreeLoadBaseline1
    | loaded |
    Metacello new
        project: 'ExternalX';
        repository: 'filetree://' , externalDirectory fullName;
        load.
    loaded := Metacello loadedProjects.
    self assert: loaded size = 1.
    self assert: (loaded at: 'ExternalX') versionString = 'baseline'