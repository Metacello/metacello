attributes
extractAtrributesFrom: gsVersion
  "gemstone   - loading into glass1 code base (extent0.seaside.dbf)
     gs*      - used to specify version specific glass1 code
   gemstone64 - loading into base gemstone system (extent0.dbf)
     gs64*    - used to specific version specific base code"

  | tokens attributes attribute |
  attributes := {#'gemstoneCommon'.
  #'gemstone64'}.
  tokens := gsVersion subStrings: $..
  attribute := ''.
  1 to: tokens size do: [ :index | | token |
    (token := tokens at: index) isEmpty
      ifTrue: [ ^ attributes ].
    attribute := attribute , token.
    attributes add: ('gsc' , attribute , '.x') asSymbol.
    attributes add: ('gs64' , attribute , '.x') asSymbol.
    attribute := attribute , '.' ].
  ^ attributes
