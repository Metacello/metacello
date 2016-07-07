tests
reenableUndefinedSybolUpdates: undefinedSymbols
  undefinedSymbols ifNil: [ self error: 'nil undefinedSymbols?' ].
  UserGlobals at: #'UndefinedSymbols' put: undefinedSymbols.
  UndefinedSymbolList addLast: undefinedSymbols