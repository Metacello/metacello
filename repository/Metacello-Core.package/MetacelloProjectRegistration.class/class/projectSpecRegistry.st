accessing
projectSpecRegistry
    ProjectSpecRegistry ifNil: [ ProjectSpecRegistry := Dictionary new ].
    ^ ProjectSpecRegistry