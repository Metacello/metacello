accessing
projectSpecs
    "MetacelloProjectRegistration projectSpecs"

    | registrations projectSpecs |
    registrations := IdentitySet new.
    projectSpecs := OrderedCollection new.
    self configurationRegistry
        keysAndValuesDo: [ :className :registration | 
            registrations add: registration.
            projectSpecs add: (self projectSpecForClassNamed: className ifAbsent: [ self error: 'not expected' ]) ].
    self baselineRegistry
        keysAndValuesDo: [ :className :registration | 
            (registrations includes: registration)
                ifFalse: [ projectSpecs add: (self projectSpecForClassNamed: className ifAbsent: [ self error: 'not expected' ]) ] ].
    ^ projectSpecs asArray