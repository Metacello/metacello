tests
testMczLoad
    | loaded |
    Metacello new
        project: 'MetacelloExample';
        version: '1.0';
        repository: 'dictionary://Metacello_MczConfiguration_Test_Repository';
        load.
    loaded := Metacello loadedProjects.
    self assert: loaded size = 1.
    self assert: ((loaded at: 'MetacelloExample') at: 2) = '1.0'