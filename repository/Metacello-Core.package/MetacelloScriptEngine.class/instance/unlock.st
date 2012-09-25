actions api
unlock
    | spec |
    MetacelloProjectRegistration
        copyRegistryRestoreOnErrorWhile: [ 
            self validateProjectSpecForScript.
            spec := self projectSpec.
            MetacelloProjectRegistration
                registrationForProjectSpec: spec
                ifAbsent: [ :ignored |  ]
                ifPresent: [ :existing :new | existing copyOnWrite: [ :existingCopy | existingCopy locked: false ] ].
            self root: spec ]