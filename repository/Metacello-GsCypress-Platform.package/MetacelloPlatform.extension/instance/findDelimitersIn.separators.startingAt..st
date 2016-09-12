*Metacello-GsCypress-Platform
findDelimitersIn: aString separators: delimiters startingAt: start
  "Answer the index of the character within aString, starting at start, that matches one of the delimiters. If aString does not contain any of the delimiters, answer size + 1."

  start to: aString size do: [ :i | 
    | e |
    e := aString at: i.
    delimiters
      do: [ :delim | 
        delim = e
          ifTrue: [ ^ i ] ] ].
  ^ aString size + 1
