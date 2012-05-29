registration
registerProjectRegistration: newRegistration ifPresent: absentBlock
    | existingRegistration |
    existingRegistration := self registry
        at: newRegistration projectName
        ifAbsent: [ ^ self registry at: newRegistration projectName put: newRegistration ].
    ^ absentBlock value: existingRegistration value: newRegistration