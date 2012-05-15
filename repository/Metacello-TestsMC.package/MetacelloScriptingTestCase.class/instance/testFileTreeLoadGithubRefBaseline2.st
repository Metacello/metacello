tests
testFileTreeLoadGithubRefBaseline2
    | loaded |
    Metacello new
        project: 'BaselineOfGithubRefXX';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load.
    loaded := Metacello loadedProjects.
    self assert: loaded size = 2.
    self flag: 'better values for the loaded version, methinks'.
    self assert: ((loaded at: 'BaselineOfGithubRefXX') at: 2) == nil.
    self assert: ((loaded at: 'External') at: 2) = ''