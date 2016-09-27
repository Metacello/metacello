running
setUp
	| projectName |
	super setUp.
	baselineProjectSpec := self createBaselineProjectSpec.
	configurationProjectSpec := self createConfigurationProjectSpec.
	projectName := baselineProjectSpec name.
	registrationA := MetacelloProjectRegistration new
		projectName: projectName;
		yourself.
	registrationB := MetacelloProjectRegistration new
		projectName: projectName;
		yourself