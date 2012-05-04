tests
testFileTreeLoad
    | loaded |
    true
        ifTrue: [ 
            "under construction: need to add metacello.json file"
            ^ self ].
    Metacello new
        project: 'External';
        repository: 'filetree://' , externalDirectory fullName;
        get.
    loaded := Metacello loadedProjects.
    self assert: loaded size = 1.
    self assert: ((loaded at: 'External') at: 2) = '1.0-beta.32Tests'