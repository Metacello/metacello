testing
hasLoadConflicts: aProjectRegistration
    (self isValid and: [ aProjectRegistration isValid ])
        ifFalse: [ ^ true ].
    self projectName = aProjectRegistration projectName
        ifFalse: [ ^ true ].
    configurationProjectSpec
        ifNil: [ 
            aProjectRegistration configurationProjectSpec notNil
                ifTrue: [ ^ true ] ]
        ifNotNil: [ 
            (aProjectRegistration configurationProjectSpec registrationsCompareEqual: configurationProjectSpec) not
                ifTrue: [ ^ true ] ].
    ^ baselineProjectSpec
        ifNil: [ false ]
        ifNotNil: [ (baselineProjectSpec registrationsCompareEqual: aProjectRegistration baselineProjectSpec) not ]