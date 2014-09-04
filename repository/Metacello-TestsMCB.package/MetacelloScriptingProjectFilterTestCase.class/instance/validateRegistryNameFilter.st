validation
validateRegistryNameFilter
  | spec |
  spec := (Metacello registry
    baseline: 'GithubRefIV';
    list) first.
  self assert: 'BaselineOfGithubRefIV' = spec className.
  spec := (Metacello registry
    configuration: 'Issue32';
    list) first.
  self assert: 'ConfigurationOfIssue32' = spec className.
  spec := (Metacello registry
    project: 'Issue32';
    list) first.
  self assert: 'ConfigurationOfIssue32' = spec className