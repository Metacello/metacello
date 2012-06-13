registration
registerProjectRegistration: newRegistration
    "unconditionally register <newRegistration> ... use with care"

    ^ self
        registerProjectRegistration: newRegistration
        ifPresent: [ :existing :new | self registryAt: new projectName put: new ]