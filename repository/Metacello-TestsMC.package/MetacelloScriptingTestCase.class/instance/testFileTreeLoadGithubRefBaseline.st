tests
testFileTreeLoadGithubRefBaseline
    | loaded |
    Metacello new
        project: 'BaselineOfGithubRef';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        get.
    Metacello new
        project: 'BaselineOfGithubRef';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load.
    loaded := Metacello loadedProjects.
    self assert: loaded size = 1.
    self assert: ((loaded at: 'BaselineOfGithubRef') at: 2) == nil