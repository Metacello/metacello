attributes
extractAtrributesFrom: gsVersion
  "gemstone   - loading into glass1/GsDevKit code base (extent0.seaside.dbf or with GsDevKit loaded)
     gs*      - used to specify version specific glass1/GsDevKit code
   gemstone64 - loading into base gemstone system (extent0.dbf)
     gs64*    - used to specific version specific base code"

  | tokens attributes attribute |
  attributes := {#'gemstoneCommon'.
  #'gemstone'}.
  tokens := gsVersion subStrings: $..
  attribute := ''.
  1 to: tokens size do: [ :index | | token |
    (token := tokens at: index) isEmpty
      ifTrue: [ ^ attributes ].
    attribute := attribute , token.
    attributes add: ('gsc' , attribute , '.x') asSymbol.
    attributes add: ('gs' , attribute , '.x') asSymbol.
    attribute := attribute , '.' ].
  ^ attributes
