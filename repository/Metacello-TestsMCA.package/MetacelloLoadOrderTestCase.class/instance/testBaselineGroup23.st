testing
testBaselineGroup23
  | project version warningSignaled |
  project := self class new project.
  warningSignaled := false.
  version := project version: '2.3-baseline'.
  [ version spec packageSpecsInLoadOrder ]
    on: Warning
    do: [ :ex | 
      warningSignaled := true.
      ex resume ].
  self assert: warningSignaled