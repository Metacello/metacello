printing
configMethodOn: aStream for: spec selector: selector last: last indent: indent
  spec == nil
    ifTrue: [ ^ self ].
  indent timesRepeat: [ aStream tab ].
  aStream
    nextPutAll: 'spec ' , selector , ' [';
    cr.
  spec configMethodOn: aStream indent: indent + 1.
  aStream nextPutAll: ' ].'.
  last
    ifFalse: [ aStream cr ]