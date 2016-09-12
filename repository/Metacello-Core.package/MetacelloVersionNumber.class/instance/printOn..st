printing
printOn: aStream
  | beforeFirst platform |
  platform := MetacelloPlatform current.
  beforeFirst := true.
  self
    do: [ :each | 
      beforeFirst
        ifTrue: [ beforeFirst := false ]
        ifFalse: [ 
          (platform isString: each)
            ifTrue: [ aStream nextPut: $- ]
            ifFalse: [ aStream nextPut: $. ] ].
      aStream nextPutAll: each asString ]