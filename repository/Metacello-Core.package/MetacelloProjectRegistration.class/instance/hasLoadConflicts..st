testing
hasLoadConflicts: aProjectRegistration
    "5 combinations of loads with no load conflicts:
        No configs and baselines =
        configs = and no baselines
        configs = and baselines =
        configs = and no baseline loaded (self) with a baseline to load (aProjectRegistration)
        config loaded (self), no config to load (aProjectRegistration) and no baseline loaded(self) with a baseline to load (aProjectRegistration) "

    (self isValid and: [ aProjectRegistration isValid ])
        ifFalse: [ ^ true ].
    self projectName = aProjectRegistration projectName
        ifFalse: [ ^ true ].
    configurationProjectSpec
        ifNil: [ 
            aProjectRegistration configurationProjectSpec notNil
                ifTrue: [ ^ true ] ]
        ifNotNil: [ 
            aProjectRegistration configurationProjectSpec
                ifNotNil: [ 
                    (aProjectRegistration configurationProjectSpec registrationsCompareEqual: configurationProjectSpec) not
                        ifTrue: [ ^ true ] ] ].
    ^ baselineProjectSpec
        ifNil: [ false ]
        ifNotNil: [ (baselineProjectSpec registrationsCompareEqual: aProjectRegistration baselineProjectSpec) not ]