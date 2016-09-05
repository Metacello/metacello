tests
disableUndefinedSybolUpdates
  | undefinedSymbols |
  Transcript
    cr;
    show:
        'MetacelloGemStonePlatform>>disableUndefinedSybolUpdates'
            , UndefinedSymbolList printString.
  undefinedSymbols := UserGlobals at: #'UndefinedSymbols'.
  UserGlobals removeKey: #'UndefinedSymbols'.
  UndefinedSymbolList removeFirst.
  ^ undefinedSymbols