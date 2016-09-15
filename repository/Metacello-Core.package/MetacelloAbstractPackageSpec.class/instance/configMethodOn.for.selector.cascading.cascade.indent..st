printing
configMethodOn: aStream for: aValue selector: selector cascading: cascading cascade: cascade indent: indent
  | valuePrintString |
  aValue == nil
    ifTrue: [ ^ self ].
  cascading
    ifTrue: [ 
      aStream cr.
      indent timesRepeat: [ aStream tab ] ].
  valuePrintString := (MetacelloPlatform current isSymbol: aValue value)
    ifTrue: [ '#' , aValue value asString printString ]
    ifFalse: [ aValue value printString ].
  aStream nextPutAll: selector , valuePrintString.
  cascade
    ifTrue: [ aStream nextPut: $; ]