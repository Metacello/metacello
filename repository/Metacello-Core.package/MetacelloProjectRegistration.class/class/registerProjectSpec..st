registration
registerProjectSpec: aProjectSpec
    "unconditionally register <aProjectSpec> ... use with care"

    ^ self registerProjectSpec: aProjectSpec ifPresent: [ :existing :new | self registryAt: new projectName put: new ]