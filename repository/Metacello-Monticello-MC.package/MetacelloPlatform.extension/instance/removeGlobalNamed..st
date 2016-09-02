*metacello-monticello-mc
removeGlobalNamed: globalName
  ^ Smalltalk removeKey: globalName ifAbsent: [  ]