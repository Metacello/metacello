*Metacello-GsCypress-Platform
detectMax: aBlock in: aCollection
  "Evaluate aBlock with each of the receiver's elements as the argument. 
	Answer the element for which aBlock evaluates to the highest magnitude.
	If collection empty, return nil.  This method might also be called elect:."

  | maxElement maxValue val |
  self do: [ :each | maxValue == nil
        ifFalse: [ val := aBlock value: each.
          (val notNil and: [ (val := aBlock value: each) > maxValue ])
            ifTrue: [ maxElement := each.
              maxValue := val ] ]
        ifTrue: [ "first element"
          maxElement := each.
          maxValue := aBlock value: each ] ].
  ^ maxElement