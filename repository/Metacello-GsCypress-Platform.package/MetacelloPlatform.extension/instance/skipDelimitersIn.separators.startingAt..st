*Metacello-GsCypress-Platform
skipDelimitersIn: aString separators: delimiters startingAt: start
  "Answer the index of the character within aString, starting at start, that does NOT match one of the delimiters. If aString does not contain any of the delimiters, answer size + 1.  Assumes the delimiters to be a non-empty string."

  start to: aString size do: [ :i | delimiters detect: [ :delim | delim = (aString at: i) ] ifNone: [ ^ i ] ].
  ^ aString size + 1
