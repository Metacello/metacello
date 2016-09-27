tests
testHasLoadConflictsRaisesErrorsIfInvalid
	registrationA baselineProjectSpec: baselineProjectSpec.
	self
		assert: registrationA isValid;
		deny: registrationB isValid;
		should: [ registrationA hasLoadConflicts: registrationB ] raise: Error;
		deny: (registrationB hasLoadConflicts: registrationA)