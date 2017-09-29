utilities
nameComponentsFrom: aVersionName
  | ar |
  ar := (aVersionName last isDigit and: [ (aVersionName indexOf: $.) > 0 ])
    ifFalse: [ 
      {aVersionName.
      ''.
      0.
      aVersionName.
      self} ]
    ifTrue: [ 
      | vrsn str |
      str := (aVersionName copyAfterLast: $-) copyAfterLast: $..
      vrsn := str isEmpty
        ifTrue: [ 0 ]
        ifFalse: [ str asInteger ].
      {(aVersionName copyUpToLast: $-).
      ((aVersionName copyAfterLast: $-) copyUpTo: $.).
      vrsn.
      aVersionName.
      self} ].
  ^ ar
