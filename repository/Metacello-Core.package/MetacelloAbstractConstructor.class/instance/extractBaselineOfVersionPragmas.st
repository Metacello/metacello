pragma extraction
extractBaselineOfVersionPragmas
    | aDict |
    aDict := Dictionary new.
    self extractPragmas: #'version:baselineOf:' into: aDict.
    ^ aDict