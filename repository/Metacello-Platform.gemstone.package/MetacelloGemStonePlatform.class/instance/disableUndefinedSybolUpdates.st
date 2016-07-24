tests
disableUndefinedSybolUpdates
  | undefinedSymbols |
  undefinedSymbols := UserGlobals at: #'UndefinedSymbols'.
  UserGlobals removeKey: #'UndefinedSymbols'.
  UndefinedSymbolList removeFirst.
  ^ undefinedSymbols