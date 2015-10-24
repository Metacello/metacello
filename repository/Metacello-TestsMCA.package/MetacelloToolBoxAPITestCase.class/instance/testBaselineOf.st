tests BaselineOf
testBaselineOf
  | x y |
  self createBaselineOf.
  self
    assert:
      (x := (Smalltalk at: self baselineName) sourceCodeAt: #'baseline:')
        = (y := self baselineOfSourceString)