tests
checkRegistrationValidity
	self assert: registrationA isValid.
	self assert: registrationA = registrationA.
	self assert: registrationA hash = registrationA hash