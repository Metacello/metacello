tests
disableUndefinedSybolUpdates
  "noop for most platforms - needed for GemStone"

  Transcript
    cr;
    show:
        'MetacelloPlatform>>disableUndefinedSybolUpdates'
            , UndefinedSymbolList printString.
  ^ nil