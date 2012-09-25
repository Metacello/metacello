merging
merge: aProjectRegistration
    "should only be called from MetacelloProjectRegistration class>>mergeRegistration:with: ... merge is done when a spec has been loaded into the image"

    "nil specs are ignored in the merge, otherwise aProjectRegistration specs win"

    "(self hasMergeConflicts: aProjectRegistration)
        ifTrue: [ ^ self error: 'Attempt to merge registrations with conflicts' ]."

    self shouldBeMutable.
    configurationProjectSpec
        ifNil: [ configurationProjectSpec := aProjectRegistration configurationProjectSpec ]
        ifNotNil: [ 
            aProjectRegistration configurationProjectSpec
                ifNotNil: [ configurationProjectSpec := aProjectRegistration configurationProjectSpec ] ].
    baselineProjectSpec
        ifNil: [ baselineProjectSpec := aProjectRegistration baselineProjectSpec ]
        ifNotNil: [ aProjectRegistration baselineProjectSpec ifNotNil: [ baselineProjectSpec := aProjectRegistration baselineProjectSpec ] ]