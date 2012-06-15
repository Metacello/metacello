registration
registrationIfPresent: presentBlock ifAbsent: absentBlock
    self configurationProjectSpec
        ifNotNil: [ :spec | self class configurationRegistry at: spec className ifPresent: [ :existing | ^ presentBlock value: existing ] ].
    self baselineProjectSpec
        ifNotNil: [ :spec | self class baselineRegistry at: spec className ifPresent: [ :existing | ^ presentBlock value: existing ] ].
    ^ absentBlock value