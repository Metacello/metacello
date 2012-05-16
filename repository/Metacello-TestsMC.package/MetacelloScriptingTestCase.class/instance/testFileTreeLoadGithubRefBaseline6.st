tests
testFileTreeLoadGithubRefBaseline6
    "ConfigurationOfExternal reference from http://ss3.gemstone.com/ss/external.html using #configuration:with:"

    | loaded |
    Metacello new
        project: 'BaselineOfGithubRefVI';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load.
    loaded := Metacello loadedProjects.
    self assert: loaded size = 2.
    self flag: 'better values for the loaded version, methinks'.
    self assert: ((loaded at: 'BaselineOfGithubRefVI') at: 2) == nil.
    self assert: ((loaded at: 'External') at: 2) = '0.9'.
    Smalltalk at: #'ConfigurationOfExternal' ifAbsent: [ self assert: false ]