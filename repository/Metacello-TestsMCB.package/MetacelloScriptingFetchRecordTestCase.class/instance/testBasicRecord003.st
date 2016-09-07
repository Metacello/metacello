tests
testBasicRecord003
	| result expected |
	result := (Metacello new
		project: 'Foo';
		version: '3.0';
		className: 'MetacelloTestConfigurationOfFoo';
		repository: 'dictionary://Metacello_Configuration_Test_Repository';
		record: #('GoferBar' 'GoferFaux')) printString.
	expected := (((MetacelloPlatform current
		globalNamed: #MetacelloTestConfigurationOfFoo) project
		version: '3.0') record: #('GoferBar' 'GoferFaux')) loadDirective
		printString.
	self assert: expected = result.
	result := (Metacello new
		project: 'Foo';
		version: '3.5';
		className: 'MetacelloTestConfigurationOfFoo';
		repository: 'dictionary://Metacello_Configuration_Test_Repository';
		record: #('GoferBeau')) printString.
	expected := (((MetacelloPlatform current
		globalNamed: #MetacelloTestConfigurationOfFoo) project
		version: '3.5') record: #('GoferBeau')) loadDirective printString.
	self assert: expected = result