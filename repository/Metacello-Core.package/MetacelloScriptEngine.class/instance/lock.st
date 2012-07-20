actions api
lock
    | spec registration |
    spec := self projectSpec.
    registration := MetacelloProjectRegistration
        registrationForProjectSpec: spec
        ifAbsent: [ :new | 
            new
                locked: true;
                registerProject ]
        ifPresent: [ :existing :new | 
            existing
                copyOnWrite: [ :existingCopy | 
                    existingCopy locked: true.
                    (spec lookupProjectSpecIn: existing)
                        ifNil: [ existingCopy merge: new ]
                        ifNotNil: [ :existingSpec | 
                            "got to figure out how to copy the correct spec that got merged ..."
                            self halt.
                            existingSpec mergeScriptRepository: spec ] ] ].
    registration locked: true.
    self root: spec