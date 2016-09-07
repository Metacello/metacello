tests
testBasicFetch004a
	| result expected version |
	result := (Metacello classic
		project: 'Fum';
		version: '1.0';
		className: 'MetacelloTestConfigurationOfProjectFum';
		repository: 'dictionary://Metacello_Configuration_Test_Repository';
		fetch) printString.
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
	self assert: expected = result