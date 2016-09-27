tests
testConfigurationsHasLoadConflicts
  "specs not loaded and locked should not conflict"

  | configurationProjectSpecB |
  configurationProjectSpecB := self createConfigurationProjectSpec
    className: 'ConfigurationOfNotDiscGolf'.
  registrationA loadedInImage: true.
  registrationA configurationProjectSpec: configurationProjectSpec.
  registrationB configurationProjectSpec: configurationProjectSpecB.
  self assert: (registrationA hasLoadConflicts: registrationB)