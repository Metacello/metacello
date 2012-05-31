accessing
configurationProjectSpec
    projectSpec := (projectSpec ifNil: [ MetacelloMCProject new projectSpec ]) asConfigurationProjectSpec.
    ^ projectSpec