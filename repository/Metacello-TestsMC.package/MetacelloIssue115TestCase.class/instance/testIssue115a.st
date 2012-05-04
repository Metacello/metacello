tests
testIssue115a
	| project versionSpec version validations |
	gofer version: 'MetacelloTestConfigurationOfProjectIssue115-dkh.1'.
	gofer metacelloLoad.
	project := self project.
	self shouldnt: [versionSpec := (version := project version: '1.0') spec] raise: Error.
	validations := MetacelloToolBox validateConfiguration: self projectClass.
	self assert: validations size = 1.
	validations detect: [ :validation | validation reasonCode == #cannotResolveVersion ] ifNone: [ self assert: false ]