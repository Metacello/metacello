project lookup
lookupProjectSpecFor: aProjectSpec
  "if there is no conflict, choose new spec"

  | registration loadedSpec |
  registration := MetacelloProjectRegistration
    registrationForProjectSpec: aProjectSpec
    ifAbsent: [ :new | new ]
    ifPresent: [ :existing :new | 
      Transcript
        cr;
        show: 'lookupProjectSpecFor: [0] ' , existing projectName.
      (existing hasLoadConflicts: new)
        ifTrue: [ 
          Transcript
            cr;
            show: 'lookupProjectSpecFor: [1]'.
          ((existing canUpgradeTo: new)
            ifTrue: [ 
              Transcript
                cr;
                show: 'lookupProjectSpecFor: [2]'.
              MetacelloAllowProjectUpgrade new ]
            ifFalse: [ 
              Transcript
                cr;
                show: 'lookupProjectSpecFor: [3]'.
              (existing canDowngradeTo: new)
                ifTrue: [ 
                  Transcript
                    cr;
                    show: 'lookupProjectSpecFor: [4]'.
                  MetacelloAllowProjectDowngrade new ]
                ifFalse: [ 
                  Transcript
                    cr;
                    show: 'lookupProjectSpecFor: [5]'.
                  MetacelloAllowConflictingProjectUpgrade new ] ])
            existingProjectRegistration: existing;
            newProjectRegistration: new;
            signal ]
        ifFalse: [ new ] ].
  Transcript
    cr;
    show: 'lookupProjectSpecFor: [6]'.
  ^ registration lookupSpec: aProjectSpec