tests
testFileTreeLoadGithubRefBaseline3
    | loaded |
    Metacello new
        project: 'BaselineOfGithubRefXXX';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load.
    loaded := Metacello loadedProjects.
    self assert: loaded size = 2.
    self flag: 'better values for the loaded version, methinks'.
    self assert: ((loaded at: 'BaselineOfGithubRefXXX') at: 2) == nil.
    self assert: ((loaded at: 'External') at: 2) = ''