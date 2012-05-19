tests
testFileTreeLoadGithubRefBaseline5
    "ConfigurationOfExternal reference from github://dalehenrich/external:configuration/repository using #configuration:with:"

    | loaded |
    Metacello new
        project: 'BaselineOfGithubRefV';
        repository: 'filetree://' , externalDirectory fullName;
        silently;
        load.
    loaded := Metacello loadedProjects.
    self assert: loaded size = 2.
    self flag: 'better values for the loaded version, methinks'.
    self assert: ((loaded at: 'BaselineOfGithubRefV') at: 2) == nil.
    self assert: ((loaded at: 'External') at: 2) = ''.
    Smalltalk at: #'ConfigurationOfExternal' ifAbsent: [ self assert: false ]