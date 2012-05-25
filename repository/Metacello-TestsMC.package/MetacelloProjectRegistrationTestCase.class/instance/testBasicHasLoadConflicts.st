tests
testBasicHasLoadConflicts
    | registrationA registrationB baselineProjectSpecA configurationProjectSpecA baselineProjectSpecB configurationProjectSpecB |
    baselineProjectSpecA := self baselineProjectSpec.
    configurationProjectSpecA := self configurationProjectSpec.
    baselineProjectSpecB := self baselineProjectSpec name: 'NotDiscGolf'.
    configurationProjectSpecB := self configurationProjectSpec name: 'NotDiscGolf'.
    registrationA := MetacelloProjectRegistration new.
    registrationB := MetacelloProjectRegistration new.
    self assert: (registrationA hasLoadConflicts: registrationB).
    registrationA projectName: baselineProjectSpecA name.
    registrationB projectName: baselineProjectSpecA name.
    self assert: (registrationA hasLoadConflicts: registrationB).
    registrationA configurationProjectSpec: nil.
    registrationA baselineProjectSpec: baselineProjectSpecA.
    registrationB configurationProjectSpec: nil.
    registrationB baselineProjectSpec: baselineProjectSpecB.
    self assert: (registrationA hasLoadConflicts: registrationB).
    registrationA configurationProjectSpec: nil.
    registrationA baselineProjectSpec: baselineProjectSpecA.
    registrationB configurationProjectSpec: nil.
    registrationB baselineProjectSpec: baselineProjectSpecA.
    self deny: (registrationA hasLoadConflicts: registrationB).
    registrationA configurationProjectSpec: configurationProjectSpecA.
    registrationA baselineProjectSpec: baselineProjectSpecA.
    registrationB configurationProjectSpec: configurationProjectSpecB.
    registrationB baselineProjectSpec: baselineProjectSpecA.
    self assert: (registrationA hasLoadConflicts: registrationB).
    registrationA configurationProjectSpec: configurationProjectSpecA.
    registrationA baselineProjectSpec: baselineProjectSpecA.
    registrationB configurationProjectSpec: configurationProjectSpecA.
    registrationB baselineProjectSpec: baselineProjectSpecB.
    self assert: (registrationA hasLoadConflicts: registrationB).
    registrationA configurationProjectSpec: configurationProjectSpecA.
    registrationA baselineProjectSpec: baselineProjectSpecA.
    registrationB configurationProjectSpec: configurationProjectSpecA.
    registrationB baselineProjectSpec: baselineProjectSpecA.
    self deny: (registrationA hasLoadConflicts: registrationB).
    registrationA configurationProjectSpec: configurationProjectSpecA.
    registrationA baselineProjectSpec: nil.
    registrationB configurationProjectSpec: configurationProjectSpecB.
    registrationB baselineProjectSpec: nil.
    self assert: (registrationA hasLoadConflicts: registrationB).
    registrationA configurationProjectSpec: configurationProjectSpecA.
    registrationA baselineProjectSpec: nil.
    registrationB configurationProjectSpec: configurationProjectSpecA.
    registrationB baselineProjectSpec: nil.
    self deny: (registrationA hasLoadConflicts: registrationB).
    registrationA configurationProjectSpec: nil.
    registrationA baselineProjectSpec: baselineProjectSpecA.
    registrationB configurationProjectSpec: configurationProjectSpecA.
    registrationB baselineProjectSpec: nil.
    self assert: (registrationA hasLoadConflicts: registrationB).
    registrationA configurationProjectSpec: configurationProjectSpecA.
    registrationA baselineProjectSpec: nil.
    registrationB configurationProjectSpec: configurationProjectSpecA.
    registrationB baselineProjectSpec: baselineProjectSpecA.
    self deny: (registrationA hasLoadConflicts: registrationB)