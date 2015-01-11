project lookup
lookupRegistrationFor: aProjectSpec isAbsent: absentBlock isExisting: existingBlock isConflict: conflictBlock
  "if there is no conflict, choose new spec"

  MetacelloProjectRegistration
    registrationForProjectSpec: aProjectSpec
    ifAbsent: [ :new | 
      absentBlock value: new.
      ^ new ]
    ifPresent: [ :existing :new | 
      (existing hasLoadConflicts: new)
        ifTrue: [ 
          | chosen |
          chosen := ((existing canUpgradeTo: new)
            ifTrue: [ MetacelloAllowProjectUpgrade new ]
            ifFalse: [ 
              (existing canDowngradeTo: new)
                ifTrue: [ MetacelloAllowProjectDowngrade new ]
                ifFalse: [ MetacelloAllowConflictingProjectUpgrade new ] ])
            existingProjectRegistration: existing;
            newProjectRegistration: new;
            signal.
          conflictBlock value: existing value: new value: chosen.
          ^ chosen ]
        ifFalse: [ 
          existingBlock value: existing value: new.
          ^ new ] ]