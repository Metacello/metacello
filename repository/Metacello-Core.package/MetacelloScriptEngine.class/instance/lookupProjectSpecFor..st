project lookup
lookupProjectSpecFor: aProjectSpec
    | registration loadedSpec |
    registration := MetacelloProjectRegistration
        registrationForProjectSpec: aProjectSpec
        ifAbsent: [ :new | new ]
        ifPresent: [ :existing :new | 
            (existing hasLoadConflicts: new)
                ifTrue: [ 
                    existing locked
                        ifTrue: [ 
                            (MetacelloAllowLockedProjectModification new
                                projectRegistration: existing;
                                signal)
                                ifFalse: [ 
                                    "don't bother checking further ... no change, but continue with load"
                                    ^ aProjectSpec lookupProjectSpecIn: existing ] ].
                    ((existing canUpgradeTo: new)
                        ifTrue: [ MetacelloAllowProjectUpgrade new ]
                        ifFalse: [ 
                            (existing canDowngradeTo: new)
                                ifTrue: [ MetacelloAllowProjectDowngrade new ]
                                ifFalse: [ MetacelloAllowConflictingProjectUpgrade new ] ])
                        existingProjectRegistration: existing;
                        newProjectRegistration: new;
                        signal ]
                ifFalse: [ new ] ].
    ^ aProjectSpec lookupProjectSpecIn: registration