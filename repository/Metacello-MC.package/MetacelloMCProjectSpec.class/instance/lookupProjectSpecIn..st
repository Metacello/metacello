scripting
lookupProjectSpecIn: aProjectRegistration
    (self className beginsWith: 'BaselineOf')
        ifTrue: [ ^ aProjectRegistration lookupBaselineSpec ].
    ^ aProjectRegistration lookupConfigurationSpec