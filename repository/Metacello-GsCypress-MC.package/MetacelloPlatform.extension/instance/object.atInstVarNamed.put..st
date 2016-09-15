*metacello-monticello-mc
object: anObject atInstVarNamed: instVarName put: instVarValue

  ^ anObject instVarAt: (anObject class allInstVarNames indexOfIdentical: instVarName asSymbol)
    put: instVarValue
