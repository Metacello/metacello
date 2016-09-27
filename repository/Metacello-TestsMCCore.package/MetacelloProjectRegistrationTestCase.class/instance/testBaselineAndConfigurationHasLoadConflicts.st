tests
testBaselineAndConfigurationHasLoadConflicts
  "specs not loaded and locked should not conflict"

  registrationA loadedInImage: true.
  registrationA baselineProjectSpec: baselineProjectSpec.
  registrationB configurationProjectSpec: configurationProjectSpec.
  self assert: (registrationA hasLoadConflicts: registrationB)