tests
reenableUndefinedSybolUpdates: undefinedSymbols
  Transcript
    cr;
    show:
        'MetacelloGemStonePlatform>>reenableUndefinedSybolUpdates: [0]'
            , UndefinedSymbolList printString.
  UserGlobals at: #'UndefinedSymbols' put: undefinedSymbols.
  UndefinedSymbolList addLast: undefinedSymbols.
  Transcript
    cr;
    show:
        'MetacelloGemStonePlatform>>reenableUndefinedSybolUpdates: [1]'
            , UndefinedSymbolList printString