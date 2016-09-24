*Metacello-GsCypress-MC
cull: anArg
  ^ self numberArgs = 0
    ifTrue: [ self value ]
    ifFalse: [ self value: anArg ]
