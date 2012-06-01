registration
registerProjectRegistration: newRegistration
    "unconditionally register <aProjectSpec> ... use with care"

    ^ self
        registerProjectRegistration: newRegistration
        ifPresent: [ :existing :new | self registryAt: new projectName put: new ]