accessing
testPrimeRegistryFromImage4
	"Get Configuration as decoy load naked Baseline ... wrong answer, but acceptable compromise ... naked baselines are a development time thing and often have locks associated with them testPrimeRegistryFromImage5 will validate lock usecase ... primeRegistryFromImage favors baselines over configurations ... "

	| rgstry registration |
	Metacello new
		configuration: 'External';
		version: '0.9.1';
		repository: 'filetree://' , externalDirectory fullName;
		get.
	Metacello new
		baseline: 'External';
		repository:
			'github://dalehenrich/external:'
				, MetacelloScriptingResource externalCustomSHA , '/repository';
		load.
	rgstry := MetacelloProjectRegistration registry.
	self validateBaseline: rgstry.
	registration := rgstry
		registrationForClassNamed: 'BaselineOfExternal'
		ifAbsent: [ self assert: false ].
	self
		assert:
			(MetacelloScriptingResource externalCustomSHA
				beginsWith: registration versionInfo versionString).
	MetacelloProjectRegistration resetRegistry.
	rgstry := MetacelloProjectRegistration registry.
	rgstry
		primeRegistryFromImage: {(MetacelloPlatform current globalNamed: #ConfigurationOfExternal)}
		baselineClasses: {(MetacelloPlatform current globalNamed: #BaselineOfExternal)}.
	self validateBaseline: rgstry.
	registration := rgstry
		registrationForClassNamed: 'BaselineOfExternal'
		ifAbsent: [ self assert: false ].
	self
		assert:
			(MetacelloScriptingResource externalCustomSHA
				beginsWith: registration versionInfo versionString)