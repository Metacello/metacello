actions api
upgrade: required
    | spec loadedSpec registration wasLocked |
    spec := self projectSpec.
    MetacelloProjectRegistration
        registrationForProjectSpec: spec
        ifAbsent: [ :ignored | self error: 'upgrade command should only be applied to a loaded project' ]
        ifPresent: [ :ignoredExisting :ignoredNew |  ].
    self get.
    registration := MetacelloProjectRegistration
        registrationForProjectSpec: spec
        ifAbsent: [ :ignored | nil ]
        ifPresent: [ :existing :new | existing ].
    wasLocked := registration locked.
    registration locked: false.
    loadedSpec := (spec lookupProjectSpecIn: registration) copy.
    spec versionString ifNotNil: [ :str | loadedSpec versionString: str ].
    self projectSpec: loadedSpec.
    self load: required.
    (MetacelloProjectRegistration
        registrationForProjectSpec: self projectSpec
        ifAbsent: [ :ignored | nil ]
        ifPresent: [ :existing :new | existing ]) locked: wasLocked