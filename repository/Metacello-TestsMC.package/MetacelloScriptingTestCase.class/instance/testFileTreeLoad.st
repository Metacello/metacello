tests
testFileTreeLoad
    | loaded |
    Metacello new
        project: 'ExternalX';
        repository: 'filetree://' , externalDirectory fullName;
        load.
    loaded := Metacello loadedProjects.
    self assert: loaded size = 1.
    self assert: ((loaded at: 'ExternalX') at: 2) = '1.0-beta.32Tests'