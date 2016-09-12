*Metacello-GsCypress-Platform
findTokens: delimiters in: aString
  "Answer the collection of tokens that result from parsing aString.  Return strings between the delimiters.  Any character in the Collection delimiters marks a border.  Several delimiters in a row are considered as just one separation.  Also, allow delimiters to be a single character."

  | tokens keyStart keyStop separators |
  tokens := OrderedCollection new.
  separators := (delimiters isKindOf: Character)
    ifTrue: [ Array with: delimiters ]
    ifFalse: [ delimiters ].
  keyStop := 1.
  [ keyStop <= aString size ]
    whileTrue: [ 
      keyStart := self skipDelimitersIn: aString separators: separators startingAt: keyStop.
      keyStop := self findDelimitersIn: aString separators: separators startingAt: keyStart.
      keyStart < keyStop
        ifTrue: [ tokens add: (aString copyFrom: keyStart to: keyStop - 1) ] ].
  ^ tokens
