tests
testBasicFetch001
	| result expected |
	result := (Metacello new
		project: 'Foo';
		version: '3.0';
		className: 'MetacelloTestConfigurationOfFoo';
		repository: 'dictionary://Metacello_Configuration_Test_Repository';
		fetch: #('GoferBar' 'GoferFaux')) printString.
	expected := (((MetacelloPlatform current
		globalNamed: #MetacelloTestConfigurationOfFoo) project
		version: '3.0') fetch: #('GoferBar' 'GoferFaux')) loadDirective
		printString.
	Transcript
		cr;
		show:
			'testBasicFetch001 [0]' , expected printString , ' = '
				, result printString.
	self assert: expected = result.
	result := (Metacello new
		project: 'Fan';
		version: '2.0';
		className: 'MetacelloTestConfigurationOfFan';
		repository: 'dictionary://Metacello_Configuration_Test_Repository';
		fetch: 'Foo') printString.
	expected := (((MetacelloPlatform current
		globalNamed: #MetacelloTestConfigurationOfFan) project
		version: '2.0') fetch: #('Foo')) loadDirective printString.
	Transcript
		cr;
		show:
			'testBasicFetch001 [1]' , expected printString , ' = '
				, result printString.
	self assert: expected = result