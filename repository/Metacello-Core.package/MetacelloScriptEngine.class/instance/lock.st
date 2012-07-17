actions api
lock
    | spec registration |
    spec := self projectSpec.
    registration := MetacelloProjectRegistration
        registrationForProjectSpec: spec
        ifAbsent: [ :new | new registerProject ]
        ifPresent: [ :existing :new | 
            (spec lookupProjectSpecIn: existing)
                ifNil: [ MetacelloProjectRegistration mergeRegistration: existing with: new ]
                ifNotNil: [ :existingSpec | existingSpec mergeScriptRepository: spec ].
            existing ].
    registration locked: true.
    self root: spec