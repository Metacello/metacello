initialization
on: aBaselineConfigurationClass
	| pragma |
	self configuration: aBaselineConfigurationClass new.
	pragma := self extractBaselinePragmaFor: aBaselineConfigurationClass.
	project := MetacelloMCProject new.
	self root: project versionSpec.
	self evaluatePragma: pragma.
	^ self root