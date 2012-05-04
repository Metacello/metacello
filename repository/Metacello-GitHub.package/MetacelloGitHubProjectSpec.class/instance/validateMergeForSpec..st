merging
validateMergeForSpec: aSpec
    aSpec class = self class
        ifTrue: [ ^ self ].
    (aSpec isKindOf: MetacelloProjectSpec)
        ifTrue: [ 
            aSpec projectPackage
                ifNotNil: [ :pp | 
                    pp includes notEmpty | pp requires notEmpty | pp getFile notNil
                        ifTrue: [ self error: 'Cannot merge a ' , aSpec class name asString , ' with includes, requires, or file set' ] ].
            aSpec getClassName notNil
                ifTrue: [ self error: 'Cannot merge a ' , aSpec class name asString , ' with className set' ] ]
        ifFalse: [ 
            self
                error:
                    'The project spec ' , self name printString , ' in project ' , self project label , ' has incompatible specs. '
                        , aSpec class name asString , ' and ' , self class name asString , ' are not compatible.' ]