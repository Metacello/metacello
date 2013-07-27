as yet unclassified
testPrimeRegistryFromImage2
  "Load Configuration/Baseline then naked Configuration"

  | rgstry original |
  Metacello new
    configuration: 'External';
    version: '0.9.1';
    repository: 'filetree://' , configurationDirectory fullName;
    load.
  self validateRegistrations: MetacelloProjectRegistration registry.
  Metacello new
    configuration: 'External';
    version: '0.9.0';
    repository: 'filetree://' , configurationDirectory fullName;
    load.
  original := MetacelloProjectRegistration registry copy.
  self validateRegistrations: MetacelloProjectRegistration registry.
  MetacelloProjectRegistration resetRegistry.
  rgstry := MetacelloProjectRegistration registry.
  rgstry
    primeRegistryFromImage: {(Smalltalk at: #'ConfigurationOfExternal')}
    baselineClasses: {(Smalltalk at: #'BaselineOfExternal')}.
  self validateRegistrations: rgstry.
  self halt