*Metacello-GsCypress-MC
globalNamed: globalName ifPresent: presentBlock
  ^ (GsSession currentSession symbolList objectNamed: globalName)
    ifNotNil: [:anObject | presentBlock value: anObject]
