testing
canUpgradeTo: aProjectRegistration
    "true if there are no load conflicts
        OR
       if the load conflicts involved two cofigurations ONLY and an upgrade is allowed"

    (self hasLoadConflicts: aProjectRegistration)
        ifFalse: [ ^ true ].
    (self isValid and: [ aProjectRegistration isValid ])
        ifFalse: [ ^ false ].
    self projectName = aProjectRegistration projectName
        ifFalse: [ ^ false ].
    configurationProjectSpec
        ifNotNil: [ 
            aProjectRegistration configurationProjectSpec
                ifNotNil: [ ^ configurationProjectSpec canUpgradeTo: aProjectRegistration configurationProjectSpec ] ].
    ^ false