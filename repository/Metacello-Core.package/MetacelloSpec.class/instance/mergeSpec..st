merging
mergeSpec: aSpec
    | newSpec nonOverridable |
    aSpec class = self class
        ifFalse: [ 
            self
                error:
                    'The project spec ' , self name printString , ' in project ' , self project label , ' has incompatible specs. '
                        , aSpec class name asString , ' and ' , self class name asString , ' are not compatible.' ].
    newSpec := self copy.
    nonOverridable := self nonOverridable.
    aSpec mergeMap
        keysAndValuesDo: [ :key :value | 
            (nonOverridable includes: key)
                ifFalse: [ 
                    value ~~ nil
                        ifTrue: [ newSpec instVarNamed: key asString put: value ] ] ].
    ^ newSpec