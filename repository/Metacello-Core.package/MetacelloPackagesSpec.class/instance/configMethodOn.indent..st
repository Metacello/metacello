printing
configMethodOn: aStream indent: indent
  | packageSpecs |
  packageSpecs := self map values.
  packageSpecs size = 0
    ifTrue: [ ^ aStream nextPutAll: 'spec add: []' ].
  packageSpecs size = 1
    ifTrue: [ 
      indent timesRepeat: [ aStream tab ].
      aStream
        nextPutAll: 'spec add: [';
        cr.
      packageSpecs first configMethodOn: aStream indent: indent + 1.
      aStream
        nextPut: $];
        cr ]
    ifFalse: [ 
      indent timesRepeat: [ aStream tab ].
      aStream nextPutAll: 'spec'.
      1 to: packageSpecs size do: [ :index | 
        | packageSpec |
        packageSpec := packageSpecs at: index.
        indent + 1 timesRepeat: [ aStream tab ].
        aStream
          nextPutAll: 'add: [';
          cr.
        packageSpec configMethodOn: aStream indent: indent + 2.
        aStream nextPut: $].
        index < packageSpecs size
          ifTrue: [ aStream nextPut: $; ].
        aStream cr ] ]