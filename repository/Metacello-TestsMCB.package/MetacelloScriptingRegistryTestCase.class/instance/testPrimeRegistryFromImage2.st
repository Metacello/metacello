accessing
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
		primeRegistryFromImage: {(MetacelloPlatform current globalNamed: #ConfigurationOfExternal)}
		baselineClasses: {(MetacelloPlatform current globalNamed: #BaselineOfExternal)}
		prioritizeConfiguration: true.
	self validateConfiguration: rgstry.
	registration := rgstry
		registrationForClassNamed: 'ConfigurationOfExternal'
		ifAbsent: [ self assert: false ].
	self assert: registration versionInfo versionString = '0.9.0'