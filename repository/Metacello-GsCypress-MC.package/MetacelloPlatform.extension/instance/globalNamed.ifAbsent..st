*metacello-monticello-mc
globalNamed: globalName ifAbsent: absentBlock
  ^ (GsSession currentSession symbolList objectNamed: globalName)
    ifNil: absentBlock
