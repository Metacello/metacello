test original
testOriginalFie35Foo35FeauxLoad
	Metacello classic
		project: 'Fie';
		className: 'MetacelloTestConfigurationOfProjectFie';
		version: '3.5';
		repository: 'dictionary://Metacello_Configuration_Test_Repository';
		load: 'Foo'.
	self validateBlockFie35FooLoad value.
	((MetacelloPlatform current
		globalNamed: #MetacelloTestConfigurationOfProjectFie) project
		version: '3.5') load: 'Feaux'.
	self validateBlockOriginalFie35FooFeuxLoad value