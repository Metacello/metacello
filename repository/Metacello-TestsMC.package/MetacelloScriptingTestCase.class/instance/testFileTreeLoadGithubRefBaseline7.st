tests
testFileTreeLoadGithubRefBaseline7
    "BaselineOfExternal reference from http://ss3.gemstone.com/ss/external.html using #baseline:with:"

    | loaded |
    Metacello new
        project: 'BaselineOfGithubRefVII';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load.
    loaded := Metacello loadedProjects.
    self assert: loaded size = 2.
    self flag: 'better values for the loaded version, methinks'.
    self assert: ((loaded at: 'BaselineOfGithubRefVII') at: 2) == nil.
    self assert: ((loaded at: 'External') at: 2) = ''.
