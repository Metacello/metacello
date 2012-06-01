registration
registrationForProjectSpec: aProjectSpec ifAbsent: absentBlock ifPresent: presentBlock
    | existing new |
    existing := self
        registrationForProjectNamed: (new := aProjectSpec asProjectRegistration) projectName
        ifAbsent: [ ^ absentBlock value: new ].
    ^ presentBlock value: existing value: new