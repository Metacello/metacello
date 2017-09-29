printing
printOn: aStream
  | printBlock |
  printBlock := [ :pkgName :ar | 
  2 timesRepeat: [ aStream tab ].
  aStream
    nextPutAll: pkgName asString;
    cr.
  3 timesRepeat: [ aStream tab ].
  aStream
    nextPutAll: (ar at: 1) asString printString;
    nextPutAll: ' to ';
    nextPutAll: (ar at: 2) asString printString;
    cr ].
  aStream
    nextPutAll: self configuration asString;
    space;
    nextPutAll: from asString printString;
    nextPutAll: ' to ';
    nextPutAll: to asString printString;
    cr.
  aStream
    tab;
    nextPutAll: 'Additions:';
    cr.
  self additions keysAndValuesDo: printBlock.
  aStream
    tab;
    nextPutAll: 'Modifications:';
    cr.
  self modifications keysAndValuesDo: printBlock.
  aStream
    tab;
    nextPutAll: 'Removals:';
    cr.
  self removals keysAndValuesDo: printBlock
