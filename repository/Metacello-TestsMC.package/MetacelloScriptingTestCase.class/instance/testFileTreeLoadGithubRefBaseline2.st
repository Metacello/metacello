tests
testFileTreeLoadGithubRefBaseline2
    "BaselineOfExternal reference from github://dalehenrich/external:957492f31b77026d81dcb165c07c69b2ad897781/repository using #baseline:with:"

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