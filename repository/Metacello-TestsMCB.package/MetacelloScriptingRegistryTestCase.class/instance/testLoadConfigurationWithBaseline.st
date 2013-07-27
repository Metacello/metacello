as yet unclassified
testLoadConfigurationWithBaseline
  "Load project from configuration that directly loads a baseline"

  Metacello new
    configuration: 'External';
    version: '0.9.1';
    repository: 'filetree://' , configurationDirectory fullName;
    load.
  self validateRegistrations: MetacelloProjectRegistration registry