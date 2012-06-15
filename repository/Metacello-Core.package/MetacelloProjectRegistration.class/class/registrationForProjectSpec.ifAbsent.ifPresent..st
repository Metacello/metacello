registration
registrationForProjectSpec: aProjectSpec ifAbsent: absentBlock ifPresent: presentBlock
    | newRegistration |
    newRegistration := aProjectSpec asProjectRegistration.
    newRegistration
        registrationIfPresent: [ :existing | ^ presentBlock value: existing value: newRegistration ]
        ifAbsent: [ ^ absentBlock value: newRegistration ]