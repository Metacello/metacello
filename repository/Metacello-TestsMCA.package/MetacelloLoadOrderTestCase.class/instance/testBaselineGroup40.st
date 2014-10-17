testing
testBaselineGroup40
  | project version errorSignaled |
  project := self class new project.
  errorSignaled := false.
  version := project version: '4.0-baseline'.
  [ version spec packageSpecsInLoadOrder ]
    on: MetacelloNameNotDefinedError
    do: [ :ex | 
      errorSignaled := true.
      ex resume ].
  self assert: errorSignaled