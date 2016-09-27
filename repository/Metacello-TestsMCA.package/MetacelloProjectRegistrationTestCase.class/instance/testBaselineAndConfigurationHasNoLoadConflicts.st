tests
testBaselineAndConfigurationHasNoLoadConflicts
  "specs not loaded and locked should not conflict"

  registrationA baselineProjectSpec: baselineProjectSpec.
  registrationB configurationProjectSpec: configurationProjectSpec.
  self deny: (registrationA hasLoadConflicts: registrationB)