accessing
baselineProjectSpec
    projectSpec := (projectSpec ifNil: [ MetacelloMCBaselineProject new projectSpec ]) asBaselineProjectSpec.
    ^ projectSpec