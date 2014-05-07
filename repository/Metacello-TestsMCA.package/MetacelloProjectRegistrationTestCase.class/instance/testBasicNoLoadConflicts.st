tests
testBasicNoLoadConflicts
	self
		assert: (baselineProjectSpec hasNoLoadConflicts: configurationProjectSpec);
		deny: (baselineProjectSpec hasLoadConflicts: configurationProjectSpec).
	configurationProjectSpec file: 'some.mcz'.
	self
		deny: (baselineProjectSpec hasNoLoadConflicts: configurationProjectSpec);
		assert: (baselineProjectSpec hasLoadConflicts: configurationProjectSpec)