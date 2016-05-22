tests BaselineOf
testBaselineOf
  self createBaselineOf.
  self
    assert:
      ((Smalltalk at: self baselineName) sourceCodeAt: #'baseline:')
        = self baselineOfSourceString