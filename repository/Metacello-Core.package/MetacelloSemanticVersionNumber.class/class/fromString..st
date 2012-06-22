instance creation
fromString: aString
    | new components tokens preRelease build versionString identifierCount normalEnd preReleaseEnd preReleaseIndex buildIndex |
    components := OrderedCollection new.
    preReleaseIndex := buildIndex := 0.
    preRelease := aString indexOf: $- startingAt: 1.
    build := aString indexOf: $+ startingAt: 1.
(build > 0 and: [preRelease > build]) ifTrue: [ preRelease := 0].
    normalEnd := preRelease = 0
        ifTrue: [ 
            build = 0
                ifTrue: [ aString size ]
                ifFalse: [ build - 1 ] ]
        ifFalse: [ preRelease - 1 ].
    versionString := aString copyFrom: 1 to: normalEnd.
    identifierCount := 0.
    (versionString findTokens: '.')
        do: [ :subString | 
            | integer |
            integer := subString asInteger.
            integer < 0
                ifTrue: [ self error: 'invalid version number' ].
            components add: integer.
            identifierCount := identifierCount + 1 ].
    identifierCount > 3
        ifTrue: [ self error: 'invalid version number' ].
    identifierCount < 3
        ifTrue: [ identifierCount to: 3 do: [ :ignored | components add: 0 ] ].
    preReleaseEnd := build = 0
        ifTrue: [ aString size ]
        ifFalse: [ build - 1 ].
    preRelease > 0
        ifTrue: [ 
            preReleaseIndex := components size + 1.
            versionString := aString copyFrom: preRelease + 1 to: preReleaseEnd.
            (versionString findTokens: '.')
                do: [ :subString | 
                    (self isSemanticIdentifier: subString)
                        ifFalse: [ self error: 'invalid version number' ].
                    components add: (self extractNumericComponent: subString) ] ].
    build > 0
        ifTrue: [ 
            buildIndex := components size + 1.
            versionString := aString copyFrom: build + 1 to: aString size.
            (versionString findTokens: '.')
                do: [ :subString | 
                    (self isSemanticIdentifier: subString)
                        ifFalse: [ self error: 'invalid version number' ].
                    components add: (self extractNumericComponent: subString) ] ].
    new := self new: components size.
    1 to: components size do: [ :i | new at: i put: (components at: i) ].
    new
        preReleaseIndex: preReleaseIndex;
        buildIndex: buildIndex.
    ^ new