validation
validateImageNameFilter
  | spec |
  spec := (Metacello image
    baseline: 'GithubRefIV';
    list) first.
  self assert: 'BaselineOfGithubRefIV' = spec className.
  spec := (Metacello image
    configuration: 'External';
    list) first.
  self assert: 'ConfigurationOfExternal' = spec className.
  spec := (Metacello image
    project: 'External';
    list) first.
  self assert: 'ConfigurationOfExternal' = spec className