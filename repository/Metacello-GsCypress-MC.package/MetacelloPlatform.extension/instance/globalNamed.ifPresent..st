*Metacello-GsCypress-MC
globalNamed: globalName ifPresent: presentBlock
  ^ (self lookupSymbolList objectNamed: globalName)
    ifNotNil: [ :anObject | presentBlock value: anObject ]