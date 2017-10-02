accessing
versionString: aStringOrSymbol
  (MetacelloPlatform current isSymbol: aStringOrSymbol)
    ifTrue: [ 
      self
        error:
          'Version string ' , aStringOrSymbol printString
            , ' for version method must be a String' ].
  super versionString: aStringOrSymbol
