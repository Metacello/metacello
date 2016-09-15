printing
configMethodOn: aStream indent: indent
  indent timesRepeat: [ aStream tab ].
  aStream nextPutAll: 'spec value: ' , self value printString