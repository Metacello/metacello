printing
configMethodValueOn: aStream for: spec selector: selector last: last indent: indent
  | valuePrintString |
  spec == nil
    ifTrue: [ ^ self ].
  valuePrintString := (MetacelloPlatform current isSymbol: spec value)
    ifTrue: [ '#' , spec value asString printString ]
    ifFalse: [ spec value printString ].
  indent timesRepeat: [ aStream tab ].
  aStream nextPutAll: 'spec ' , selector , ' ' , valuePrintString , '.'.
  last
    ifFalse: [ aStream cr ]