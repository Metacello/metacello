registration
registerProjectSpec: aProjectSpec ifPresent: absentBlock
    | newRegistration existingRegistration |
    newRegistration := aProjectSpec asProjectRegistration.
    existingRegistration := self registry
        at: newRegistration projectName
        ifAbsent: [ ^ self registry at: newRegistration projectName put: newRegistration ].
    absentBlock value: existingRegistration value: newRegistration