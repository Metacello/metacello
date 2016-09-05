tests
reenableUndefinedSybolUpdates: undefinedSymbols
  "noop for most platforms - needed for GemStone"

  Transcript
    cr;
    show:
        'MetacelloPlatform>>reenableUndefinedSybolUpdates:'
            , UndefinedSymbolList printString