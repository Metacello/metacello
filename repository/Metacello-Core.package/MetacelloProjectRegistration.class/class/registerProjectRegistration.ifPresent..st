registration
registerProjectRegistration: newRegistration ifPresent: presentBlock
    | existingRegistration |
    existingRegistration := self registry
        at: newRegistration projectName
        ifAbsent: [ ^ self registryAt: newRegistration projectName put: newRegistration ].
    ^ presentBlock value: existingRegistration value: newRegistration