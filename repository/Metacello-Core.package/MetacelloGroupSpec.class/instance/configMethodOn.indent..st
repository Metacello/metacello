printing
configMethodOn: aStream indent: indent
  indent timesRepeat: [ aStream tab ].
  aStream
    nextPutAll: 'spec ';
    cr.
  indent + 1 timesRepeat: [ aStream tab ].
  aStream nextPutAll: 'name: ' , self name printString , ';'.
  self
    configMethodBodyOn: aStream
    hasName: true
    cascading: false
    indent: indent + 1.
  aStream nextPut: $.
