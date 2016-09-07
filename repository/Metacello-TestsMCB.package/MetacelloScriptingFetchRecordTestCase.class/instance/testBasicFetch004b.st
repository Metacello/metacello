tests
testBasicFetch004b
	| result expected version |
	MetacelloPlatform current
		metacelloLoadPackages: {'MetacelloTestConfigurationOfProjectFum'}
		from:
			{(MetacelloPlatform current
				globalNamed: #Metacello_Configuration_Test_Repository)}.
	version := (MetacelloPlatform current
		globalNamed: #MetacelloTestConfigurationOfProjectFum) project
		version: '1.0'.
	expected := version fetch loadDirective printString.
	result := (Metacello classic
		project: 'Fum';
		version: '1.0';
		className: 'MetacelloTestConfigurationOfProjectFum';
		repository: 'dictionary://Metacello_Configuration_Test_Repository';
		fetch) printString.
	expected := version fetch loadDirective printString.
	self assert: expected = result