method generation
methodSource
  | strm |
  strm := WriteStream on: String new.
  self
    symbolicMethodSelectorAndPragma: self selector
    symbolicVersionSymbol: self versionString
    on: strm.
  (MetacelloPlatform current
    sort: self methodSections asArray
    with: [ :a :b | a attributes first <= b attributes first ])
    do: [ :methodSection | 
      | vs |
      strm
        cr;
        tab;
        nextPutAll:
            'spec for: ' , methodSection attributePrintString , ' version: '.
      vs := methodSection versionString.
      (MetacelloPlatform current isSymbol: vs)
        ifTrue: [ strm nextPut: $# ].
      strm
        nextPutAll: vs asString printString , '.';
        cr ].
  ^ strm contents