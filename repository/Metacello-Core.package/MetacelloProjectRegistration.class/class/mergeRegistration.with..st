registration
mergeRegistration: aRegistration with: anotherRegistration
    | registrationName |
    registrationName := aRegistration projectName.
    self registry at: registrationName ifAbsent: [ ^ aRegistration merge: anotherRegistration ].
    aRegistration unregisterProjectSpecs: self projectSpecRegistry.
    aRegistration merge: anotherRegistration.
    aRegistration registerProjectSpecs: self projectSpecRegistry.
    ^ aRegistration