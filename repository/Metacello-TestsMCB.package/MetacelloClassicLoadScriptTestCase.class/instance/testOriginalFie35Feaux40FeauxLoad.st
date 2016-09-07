test original
testOriginalFie35Feaux40FeauxLoad
	Metacello classic
		project: 'Fie';
		className: 'MetacelloTestConfigurationOfProjectFie';
		version: '3.5';
		repository: 'dictionary://Metacello_Configuration_Test_Repository';
		load: 'Feaux'.
	self validateBlockFie35FeauxLoad value.
	((MetacelloPlatform current
		globalNamed: #MetacelloTestConfigurationOfProjectFie) project
		version: '4.0') load: 'Feaux'.
	self validateBlockOriginalFie40FeauxLoad value