actions api
unlock
    | spec |
    spec := self projectSpec.
    MetacelloProjectRegistration
        registrationForProjectSpec: spec
        ifAbsent: [ :ignored |  ]
        ifPresent: [ :existing :new | existing locked: false ].
    self root: spec