scripting
lookupProjectSpecIn: aProjectRegistration
    self halt: 'I do not trust this method ... we should have either a baseline or configuration by this point in time'.
    (self className beginsWith: 'BaselineOf')
        ifTrue: [ ^ aProjectRegistration lookupBaselineSpec ].
    ^ aProjectRegistration lookupConfigurationSpec