tests
testConfigurationsHasNoLoadConflicts
  "specs not loaded and locked should not conflict"

  | configurationProjectSpecB |
  configurationProjectSpecB := self createConfigurationProjectSpec
    className: 'ConfigurationOfNotDiscGolf'.
  registrationA configurationProjectSpec: configurationProjectSpec.
  registrationB configurationProjectSpec: configurationProjectSpecB.
  self deny: (registrationA hasLoadConflicts: registrationB)