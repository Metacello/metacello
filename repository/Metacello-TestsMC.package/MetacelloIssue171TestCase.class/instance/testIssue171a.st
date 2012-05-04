tests
testIssue171a
    | project versionSpec version validations |
    gofer version: 'MetacelloTestConfigurationOfProjectIssue171-dkh.1'.
    gofer metacelloLoad.
    project := self project.
    self shouldnt: [ versionSpec := (version := project version: '2.0') spec ] raise: Error.
    validations := MetacelloToolBox validateConfiguration: self projectClass.
    self assert: validations size = 1.
    validations
        detect: [ :validation | validation reasonCode == #'missingRecommendedProjectSpecField' ]
        ifNone: [ self assert: false ]