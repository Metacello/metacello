tests
testInvalidRegistration
	self deny: registrationA isValid.
	registrationA baselineProjectSpec: baselineProjectSpec.
	self assert: registrationA isValid.
	registrationA projectName: nil.
	self deny: registrationA isValid.
	self deny: registrationB isValid.
	registrationB configurationProjectSpec: configurationProjectSpec.
	self assert: registrationB isValid