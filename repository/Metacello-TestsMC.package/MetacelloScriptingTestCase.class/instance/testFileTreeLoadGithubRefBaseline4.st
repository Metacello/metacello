tests
testFileTreeLoadGithubRefBaseline4
    | loaded |
    Metacello new
        project: 'BaselineOfGithubRefIV';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load.
    loaded := Metacello loadedProjects.
    self assert: loaded size = 2.
    self flag: 'better values for the loaded version, methinks'.
    self assert: ((loaded at: 'BaselineOfGithubRefIV') at: 2) == nil.
    self assert: ((loaded at: 'External') at: 2) = '0.9'.
    Smalltalk at: #'ConfigurationOfExternal' ifAbsent: [ self assert: false ]