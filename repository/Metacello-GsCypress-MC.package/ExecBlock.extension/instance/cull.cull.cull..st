*Metacello-GsCypress-MC
cull: firstArg cull: secondArg cull: thirdArg
  ^ self numberArgs < 3
    ifTrue: [ self cull: firstArg cull: secondArg ]
    ifFalse: [ self value: firstArg value: secondArg value: thirdArg ]
