private
registryAt: aName put: aRegistration
    self registry
        at: aName
        ifPresent: [ :oldRegistration | oldRegistration unregisterProjectSpecs: self projectSpecRegistry ].
    self registry at: aName put: aRegistration.
    aRegistration registerProjectSpecs: self projectSpecRegistry.
    ^ aRegistration