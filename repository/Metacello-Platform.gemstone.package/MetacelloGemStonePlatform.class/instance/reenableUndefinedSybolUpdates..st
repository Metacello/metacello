tests
reenableUndefinedSybolUpdates: undefinedSymbols
  Transcript
    cr;
    show:
        'MetacelloGemStonePlatform>>reenableUndefinedSybolUpdates:'
            , UndefinedSymbolList printString.
  UserGlobals at: #'UndefinedSymbols' put: undefinedSymbols.
  UndefinedSymbolList addLast: undefinedSymbols