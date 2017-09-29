testing
hasConflictWithProjectSpec: projectSpec
  ((self className indexOfSubCollection: 'BaselineOf') = 1)
    ifTrue: [ ^ projectSpec hasConflictWithBaselineSpec: self asBaselineProjectSpec ].
  ^ projectSpec
    hasConflictWithConfigurationSpec: self asConfigurationProjectSpec
