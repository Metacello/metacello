registration
registerProjectSpec: aProjectSpec ifPresent: presentBlock
    | newRegistration |
    newRegistration := aProjectSpec asProjectRegistration.
    newRegistration
        registrationIfPresent: [ :existing | presentBlock value: existing value: newRegistration ]
        ifAbsent: [ ^ newRegistration registerProject ]