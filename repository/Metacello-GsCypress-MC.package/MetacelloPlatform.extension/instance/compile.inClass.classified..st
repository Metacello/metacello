*Metacello-GsCypress-MC
compile: sourceString inClass: aClass classified: methodProtocol
  | gsNMethod |
  gsNMethod := aClass
    compileMethod: sourceString
    dictionaries: GsSession currentSession symbolList
    category: methodProtocol
    environmentId: 0.
  ^ gsNMethod selector