testing
hasConflictWithBaselineSpec: projectSpec
  projectSpec name = self name
    ifFalse: [ ^ true ].
  projectSpec project configuration class name asString
    = self project configuration class name asString
    ifFalse: [ ^ true ].
  ^ ((projectSpec repositories isEmpty or: [ self repositories isEmpty ])
    or: [ projectSpec repositories hasNoLoadConflicts: self repositories ]) not
