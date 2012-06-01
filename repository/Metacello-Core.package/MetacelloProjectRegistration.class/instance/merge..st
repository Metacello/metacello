merging
merge: aProjectRegistration
    "should only be called from MetacelloProjectRegistration class>>mergeRegistration:with:"

    (self hasLoadConflicts: aProjectRegistration)
        ifTrue: [ ^ self error: 'Attempt to merge registrations with conflicts' ].
    configurationProjectSpec
        ifNil: [ configurationProjectSpec := aProjectRegistration configurationProjectSpec ]
        ifNotNil: [ 
            aProjectRegistration configurationProjectSpec
                ifNotNil: [ configurationProjectSpec := aProjectRegistration configurationProjectSpec ] ].
    baselineProjectSpec := aProjectRegistration baselineProjectSpec