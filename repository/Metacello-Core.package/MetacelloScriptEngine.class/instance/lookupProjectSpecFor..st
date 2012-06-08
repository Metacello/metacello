project lookup
lookupProjectSpecFor: aProjectSpec
    | registration |
    registration := MetacelloProjectRegistration
        registrationForProjectSpec: aProjectSpec
        ifAbsent: [ :new | new ]
        ifPresent: [ :existing :new | 
            (existing hasLoadConflicts: new)
                ifTrue: [ 
                    ((existing canUpgradeTo: new)
                        ifTrue: [ MetacelloAllowProjectUpgrade new ]
                        ifFalse: [ MetacelloAllowConflictingProjectUpgrade new ])
                        existingProjectRegistration: existing;
                        newProjectRegistration: new;
                        signal ]
                ifFalse: [ new ] ].
    ^ aProjectSpec lookupProjectSpecIn: registration