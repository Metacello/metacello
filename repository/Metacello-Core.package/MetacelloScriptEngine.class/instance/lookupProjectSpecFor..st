project lookup
lookupProjectSpecFor: aProjectSpec
  "if there is no conflict, choose new spec"

  | registration loadedSpec |
  registration := MetacelloProjectRegistration
    registrationForProjectSpec: aProjectSpec
    ifAbsent: [ :new | new ]
    ifPresent: [ :existing :new | 
      existing locked
        ifTrue: [ 
          | reg |
          reg := MetacelloAllowLockedProjectChange new
            operationString: 'pre-emptive lock enforced check';
            existingProjectRegistration: existing;
            newProjectRegistration: new;
            signal.
          reg == existing
            ifTrue: [ ^ reg projectSpec ] ].
      (existing hasLoadConflicts: new)
        ifTrue: [ 
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
  ^ registration projectSpec