*Metacello-GsCypress-Platform
matchPattern: patternString in: aString
  | special pattern keyStart keyStop char |
  special := {$#.
  $*}.
  pattern := OrderedCollection new.
  keyStart := keyStop := 1.
  [ keyStop <= patternString size ]
    whileTrue: [ 
      keyStop := self findDelimitersIn: patternString separators: special startingAt: keyStart.
      keyStart <= keyStop
        ifTrue: [ 
          keyStart = keyStop
            ifTrue: [ keyStart := keyStart + 1 ]
            ifFalse: [ 
              pattern add: (patternString copyFrom: keyStart to: keyStop - 1).
              keyStart := keyStop + 1 ].
          keyStop <= patternString size
            ifTrue: [ 
              char := patternString at: keyStop.
              char == $#
                ifTrue: [ char := $? ].
              pattern add: char ] ] ].
  ^ aString _matchPatternNoCase: pattern asArray
