testing
hasMergeConflicts: aProjectRegistration
    "Allow valid registrations to be merged"

    (self isValid and: [ aProjectRegistration isValid ])
        ifFalse: [ ^ true ].
    self projectName = aProjectRegistration projectName
        ifFalse: [ ^ true ].
    ^ false