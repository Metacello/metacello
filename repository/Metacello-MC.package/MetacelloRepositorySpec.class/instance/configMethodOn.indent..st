printing
configMethodOn: aStream indent: indent
  indent timesRepeat: [ aStream tab ].
  aStream nextPutAll: 'spec '.
  self configMethodCascadeOn: aStream lastCascade: true