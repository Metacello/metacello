private
validateBaseline: baselineClass
  (MetacelloMCVersionValidator validateBaseline: baselineClass)
    select: [ :issue | 
      "should have no critical issues"
      self assert: issue isCritical not ]