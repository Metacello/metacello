*Metacello-GsCypress-MC
globalNamed: globalName put: anObject
  "which symbolDictionary should be used for storing Globals"

  "UserGlobals ?"

  UserGlobals at: globalName asSymbol put: anObject
