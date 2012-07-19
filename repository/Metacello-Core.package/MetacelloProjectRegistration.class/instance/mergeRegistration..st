registration
mergeRegistration: anotherRegistration
    self class registry
        registrationFor: self
        ifPresent: [ :existing |  ]
        ifAbsent: [ ^ self merge: anotherRegistration ].
    self unregisterProject.
    self merge: anotherRegistration.
    self registerProject