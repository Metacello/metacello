*Metacello-GsCypress-MC
globalNamed: globalName ifAbsent: absentBlock
  ^ (self lookupSymbolList objectNamed: globalName) ifNil: absentBlock