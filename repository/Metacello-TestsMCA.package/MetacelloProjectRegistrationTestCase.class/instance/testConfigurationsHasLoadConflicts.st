tests
testConfigurationsHasLoadConflicts
	| configurationProjectSpecB |
	configurationProjectSpecB := self createConfigurationProjectSpec className: 'ConfigurationOfNotDiscGolf'.
	registrationA configurationProjectSpec: configurationProjectSpec.
	registrationB configurationProjectSpec: configurationProjectSpecB.
	self assert: (registrationA hasLoadConflicts: registrationB)