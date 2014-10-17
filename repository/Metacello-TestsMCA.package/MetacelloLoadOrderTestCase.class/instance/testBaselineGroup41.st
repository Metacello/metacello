testing
testBaselineGroup41
  | project version errorSignaled |
  project := self class new project.
  errorSignaled := false.
  version := project version: '4.1-baseline'.
  [ version spec packageSpecsInLoadOrder ]
    on: Error
    do: [ :ex | 
      errorSignaled := true.
      ex pass ].
  self assert: errorSignaled