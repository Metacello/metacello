registration
registerProjectRegistration: newRegistration ifPresent: absentBlock
    | existingRegistration |
    existingRegistration := self registry
        at: newRegistration projectName
        ifAbsent: [ ^ self registryAt: newRegistration projectName put: newRegistration ].
    ^ absentBlock value: existingRegistration value: newRegistration