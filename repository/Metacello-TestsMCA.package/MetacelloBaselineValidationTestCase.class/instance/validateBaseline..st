private
validateBaseline: baselineClass
  (self basicValidateBaseline: baselineClass)
    select: [ :issue | 
      "should have no critical issues"
      self assert: issue isCritical not ]