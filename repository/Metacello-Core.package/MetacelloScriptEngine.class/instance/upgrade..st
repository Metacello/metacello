actions api
upgrade: required
    MetacelloProjectRegistration
        registrationForProjectSpec: self projectSpec
        ifAbsent: [ :ignored | self error: 'upgrade command should only be applied to a loaded project' ]
        ifPresent: [ :ignoredExisting :ignoredNew |  ].
    self
        load: required
        onProjectDownGrade: [ :ex :existing :new | ex allow ]
        onProjectUpgrade: [ :ex :existing :new | ex allow ]
        onProjectLock: [ :ex :existing :ignored | ex allow ]