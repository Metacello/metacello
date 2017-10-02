printing
configMethodOn: aStream indent: indent
  indent timesRepeat: [ aStream tab ].
  aStream
    nextPutAll: 'spec';
    cr.
  self configMethodCascadeOn: aStream indent: indent
