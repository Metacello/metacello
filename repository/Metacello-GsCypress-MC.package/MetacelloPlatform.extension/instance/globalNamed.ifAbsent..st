*Metacello-GsCypress-MC
globalNamed: globalName ifAbsent: absentBlock
  ^ (GsSession currentSession symbolList objectNamed: globalName)
    ifNil: absentBlock
