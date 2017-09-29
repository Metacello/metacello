scripting
asProjectRegistration
  ((self className indexOfSubCollection: 'BaselineOf') = 1)
    ifTrue: [ 
      ^ MetacelloProjectRegistration
        fromMCBaselineProjectSpec: self asBaselineProjectSpec ].
  ^ MetacelloProjectRegistration
    fromMCConfigurationProjectSpec: self asConfigurationProjectSpec
