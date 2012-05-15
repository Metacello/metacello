tests
testGitHubLoad3
    | loaded |
    Metacello new
        project: 'External';
        version: '957492f31b77026d81dcb165c07c69b2ad897781';
        repository: 'github://dalehenrich/external/repository';
        load.
    loaded := Metacello loadedProjects.
    self assert: loaded size = 1.
    self assert: ((loaded at: 'External') at: 2) = nil