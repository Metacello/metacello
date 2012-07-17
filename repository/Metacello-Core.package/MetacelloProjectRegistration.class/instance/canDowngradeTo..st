testing
canDowngradeTo: aProjectRegistration
    "true if there are no load conflicts
        OR
       if the load conflicts involved two cofigurations ONLY and a downgrade is allowed"

    (self hasLoadConflicts: aProjectRegistration)
        ifFalse: [ ^ true ].
    (self isValid and: [ aProjectRegistration isValid ])
        ifFalse: [ ^ false ].
    configurationProjectSpec
        ifNotNil: [ 
            aProjectRegistration configurationProjectSpec
                ifNotNil: [ 
                    configurationProjectSpec ensureProjectLoaded.
                    (self locked or: [ aProjectRegistration locked ])
                        ifTrue: [ ^ false ].
                    ^ configurationProjectSpec canDowngradeTo: aProjectRegistration configurationProjectSpec ] ].
    ^ false