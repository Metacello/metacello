*metacello-mc
removeGlobalNamed: globalName
  ^ Smalltalk removeKey: globalName ifAbsent: [  ]