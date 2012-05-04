tests
testIssue171b
    | project versionSpec version validations expectedReasonCodes reasonCodes |
    gofer version: 'MetacelloTestConfigurationOfProjectIssue171-dkh.2'.
    gofer metacelloLoad.
    project := self project.
    self shouldnt: [ versionSpec := (version := project version: '2.1') spec ] raise: Error.
    validations := MetacelloToolBox validateConfiguration: self projectClass.
    expectedReasonCodes := #(#'missingRecommendedProjectSpecField' #'incompleteProjectSpec' #'versionCompositionError').
    reasonCodes := (validations collect: [ :each | each reasonCode ]) asSet.
    self assert: reasonCodes size = expectedReasonCodes size.
    expectedReasonCodes do: [ :reasonCode | reasonCodes includes: reasonCode ]