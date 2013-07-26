as yet unclassified
testLoadConfigurationThenBaseline
  "Load project from configuration, then load project from baseline"

  | rgstry specs configurationRegistrations baselineRegistrations |
  true
    ifTrue: [ ^ self ].
  Metacello new
    configuration: 'External';
    version: '0.9.0';
    repository: 'filetree://' , configurationDirectory fullName;
    load.
  Metacello new
    baseline: 'External';
    repository: 'filetree://' , configurationDirectory fullName;
    load.
  self validateRegistrations: MetacelloProjectRegistration registry