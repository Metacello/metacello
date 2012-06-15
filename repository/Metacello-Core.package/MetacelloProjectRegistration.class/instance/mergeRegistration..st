registration
mergeRegistration: anotherRegistration
    self registrationIfPresent: [ :existing |  ] ifAbsent: [ ^ self merge: anotherRegistration ].
    self unregisterProject.
    self merge: anotherRegistration.
    self registerProject