accessing
baselineRegistry
    BaselineRegistry ifNil: [ BaselineRegistry := Dictionary new ].
    ^ BaselineRegistry