as yet unclassified
testPrimeRegistryFromImage1
  "Load naked Configuration then Configuration/Baseline"

  "Cover case where a BaselineOf is loaded in after a standard ConfigurationOf
	https://github.com/dalehenrich/metacello-work/issues/197#issuecomment-21625223"

  | rgstry registration |
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