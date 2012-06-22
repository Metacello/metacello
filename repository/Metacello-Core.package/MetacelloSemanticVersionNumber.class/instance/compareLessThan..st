private
compareLessThan: aMetacelloVersionNumber
    | myComponents otherComponents defaultResult |
    aMetacelloVersionNumber species = self species
        ifFalse: [ ^ false ].
    myComponents := self normalVersion.
    otherComponents := aMetacelloVersionNumber normalVersion.
    defaultResult := true.
    (self compareEqualTo: myComponents other: otherComponents)
        ifTrue: [ defaultResult := false ]
        ifFalse: [ 
            (self compareLessThan: myComponents other: otherComponents)
                ifFalse: [ ^ false ] ].
    myComponents := self preReleaseVersion.
    otherComponents := aMetacelloVersionNumber preReleaseVersion.
    (self compareEqualTo: myComponents other: otherComponents)
        ifTrue: [ defaultResult := false ]
        ifFalse: [ ^ self compareLessThan: myComponents other: otherComponents ].
    myComponents := self buildVersion.
    otherComponents := aMetacelloVersionNumber buildVersion.
    ^ (self compareEqualTo: myComponents other: otherComponents)
        ifTrue: [ defaultResult ]
        ifFalse: [ self compareLessThan: myComponents other: otherComponents ]