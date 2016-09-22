*metacello-mc
cull: firstArg cull: secondArg
  ^ self numberArgs < 2
    ifTrue: [ self cull: firstArg ]
    ifFalse: [ self value: firstArg value: secondArg ]
