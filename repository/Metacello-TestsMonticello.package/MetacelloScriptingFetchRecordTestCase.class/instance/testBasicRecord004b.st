tests
testBasicRecord004b
	| result expected version |
	MetacelloPlatform current
		metacelloLoadPackages: {'MetacelloTestConfigurationOfProjectFum'}
		from:
			{(MetacelloPlatform current
				globalNamed: #Metacello_Configuration_Test_Repository)}.
	version := (MetacelloPlatform current
		globalNamed: #MetacelloTestConfigurationOfProjectFum) project
		version: '1.0'.
	expected := version record loadDirective printString.
	result := (Metacello classic
		project: 'Fum';
		version: '1.0';
		className: 'MetacelloTestConfigurationOfProjectFum';
		repository: 'dictionary://Metacello_Configuration_Test_Repository';
		record) printString.
	expected := version record loadDirective printString.
	self assert: expected = result