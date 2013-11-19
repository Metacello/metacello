tests
testBaselinesHasLoadConflicts
	| baselineProjectSpecB |
	baselineProjectSpecB := self createBaselineProjectSpec className: 'BaselineOfNotDiscGolf'.
	registrationA baselineProjectSpec: baselineProjectSpec.
	registrationB baselineProjectSpec: baselineProjectSpecB.
	self assert: (registrationA hasLoadConflicts: registrationB)