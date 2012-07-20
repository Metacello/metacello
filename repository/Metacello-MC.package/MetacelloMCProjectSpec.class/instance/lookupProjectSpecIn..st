scripting
lookupProjectSpecIn: aProjectRegistration
    (self projectClass inheritsFrom: BaselineOf)
        ifTrue: [ ^ aProjectRegistration lookupBaselineSpec ].
    ^ aProjectRegistration lookupConfigurationSpec