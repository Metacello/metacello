as yet unclassified
testPrimeRegistryFromImage1
  "Cover case where a BaselineOf is loaded in after a standard ConfigurationOf
	https://github.com/dalehenrich/metacello-work/issues/197#issuecomment-21625223"

  | rgstry |
  Metacello new
    configuration: 'External';
    version: '0.9.0';
    repository: 'filetree://' , configurationDirectory fullName;
    load.
  Metacello new
    configuration: 'External';
    version: '0.9.1';
    repository: 'filetree://' , configurationDirectory fullName;
    load.
  MetacelloProjectRegistration resetRegistry.
  rgstry := MetacelloProjectRegistration registry.
  rgstry
    primeRegistryFromImage: {(Smalltalk at: #'ConfigurationOfExternal')}
    baselineClasses: {(Smalltalk at: #'BaselineOfExternal')}.
