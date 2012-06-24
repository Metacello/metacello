registration
registrationIfPresent: presentBlock ifAbsent: absentBlock
    | baseName |
    baseName := self baseName.
    self configurationProjectSpec
        ifNotNil: [ :spec | self class configurationRegistry at: spec className ifPresent: [ :existing | ^ presentBlock value: existing ] ].
    self baselineProjectSpec
        ifNotNil: [ :spec | self class baselineRegistry at: spec className ifPresent: [ :existing | ^ presentBlock value: existing ] ].
    self class configurationRegistry
        at: 'ConfigurationOf' , baseName
        ifPresent: [ :existing | ^ presentBlock value: existing ].
    self class baselineRegistry at: 'BaselineOf' , baseName ifPresent: [ :existing | ^ presentBlock value: existing ].
    ^ absentBlock value