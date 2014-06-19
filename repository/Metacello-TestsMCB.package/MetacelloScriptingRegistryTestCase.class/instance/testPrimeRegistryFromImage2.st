as yet unclassified
testPrimeRegistryFromImage2
  "Load Configuration/Baseline then naked Configuration"

  | rgstry original registration |
  Metacello new
    configuration: 'External';
    version: '0.9.1';
    repository: 'filetree://' , externalDirectory fullName;
    load.
  rgstry := MetacelloProjectRegistration registry.
  self validateConfiguration: rgstry.
  registration := rgstry
    registrationForClassNamed: 'ConfigurationOfExternal'
    ifAbsent: [ self assert: false ].
  self assert: registration versionInfo versionString = '0.9.1'.
  Metacello new
    configuration: 'External';
    version: '0.9.0';
    repository: 'filetree://' , externalDirectory fullName;
    load.
  rgstry := MetacelloProjectRegistration registry.
  self validateConfiguration: rgstry.
  registration := rgstry
    registrationForClassNamed: 'ConfigurationOfExternal'
    ifAbsent: [ self assert: false ].
  self assert: registration versionInfo versionString = '0.9.0'.
  original := MetacelloProjectRegistration registry copy.
  MetacelloProjectRegistration resetRegistry.
  rgstry := MetacelloProjectRegistration registry.
  rgstry
    primeRegistryFromImage: {(Smalltalk at: #'ConfigurationOfExternal')}
    baselineClasses: {(Smalltalk at: #'BaselineOfExternal')}
    prioritizeConfiguration: true.
  self validateConfiguration: rgstry.
  registration := rgstry
    registrationForClassNamed: 'ConfigurationOfExternal'
    ifAbsent: [ self assert: false ].
  self assert: registration versionInfo versionString = '0.9.0'