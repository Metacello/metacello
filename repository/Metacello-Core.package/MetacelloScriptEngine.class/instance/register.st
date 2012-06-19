actions api
register
    | registration registerProjectSpec targetSpec |
    self validateProjectSpec: #'validateForScriptLoad:'.
    registerProjectSpec := self projectSpec.
    MetacelloProjectRegistration
        registrationForProjectSpec: registerProjectSpec
        ifAbsent: [ :new | registration := new ]
        ifPresent: [ :existing :new | self halt ].
    targetSpec := registerProjectSpec lookupProjectSpecIn: registration.
    self root: targetSpec.
    MetacelloProjectRegistration
        registerProjectSpec: targetSpec
        ifPresent: [ :existing :new | MetacelloProjectRegistration mergeRegistration: existing with: new ]