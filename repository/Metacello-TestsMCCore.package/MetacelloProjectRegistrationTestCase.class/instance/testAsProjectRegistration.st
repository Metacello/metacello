tests
testAsProjectRegistration
	self
		assert: baselineProjectSpec asProjectRegistration isValid;
		assert: configurationProjectSpec asProjectRegistration isValid