*Metacello-GsCypress-MC
cull: firstArg cull: secondArg cull: thirdArg cull: fourthArg
  ^ self numberArgs < 4
    ifTrue: [ self cull: firstArg cull: secondArg cull: thirdArg ]
    ifFalse: [ 
      self
        value: firstArg
        value: secondArg
        value: thirdArg
        value: fourthArg ]
