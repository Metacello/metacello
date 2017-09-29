printing
configMethodOn: aStream indent: indent
  indent timesRepeat: [ aStream tab ].
  aStream
    nextPutAll: 'spec ';
    cr.
  indent + 1 timesRepeat: [ aStream tab ].
  aStream
    nextPutAll: 'name: ' , self name printString;
    nextPut: $;;
    cr.
  indent + 1 timesRepeat: [ aStream tab ].
  aStream
    nextPutAll: 'projectReference: ';
    nextPut: $[;
    cr.
  indent + 2 timesRepeat: [ aStream tab ].
  aStream nextPutAll: 'spec'.
  self projectReference
    ifNotNil: [ self projectReference configMethodBodyOn: aStream indent: indent + 2 ].
  aStream nextPutAll: ' ].'
