scripting
mergeScriptLoads: aSpec
    aSpec loads
        ifNotNil: [ :otherLoads | self loads ifNil: [ loads := otherLoads ] ifNotNil: [ loads := loads , otherLoads ] ].
    self loader: aSpec loader