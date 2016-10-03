attributes
extractAtrributesFrom: gsVersion
  | tokens attributes attribute |
  attributes := {#'gemstoneCommon'.
  #'gemstoneBase'}.
  tokens := gsVersion subStrings: $..
  attribute := ''.
  1 to: tokens size do: [ :index | 
    | token |
    (token := tokens at: index) isEmpty
      ifTrue: [ ^ attributes ].
    attribute := attribute , token.
    attributes add: ('gsc' , attribute , '.x') asSymbol.
    attributes add: ('gsb' , attribute , '.x') asSymbol.
    attribute := attribute , '.' ].
  ^ attributes