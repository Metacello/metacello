instance creation
fromString: aString
  | new components |
  components := OrderedCollection new.
  (MetacelloPlatform current findTokens: '.' in: aString)
    do: [ :subString | 
      | strs |
      strs := MetacelloPlatform current findTokens: '-' in: subString.	"first subString token could be an integer"
      components add: (self extractNumericComponent: strs first).
      strs size > 1
        ifTrue: [ 
          "remaining are uncoditionally Strings, because of leading $-"
          components addAll: (strs copyFrom: 2 to: strs size) ] ].
  new := self new: components size.
  1 to: components size do: [ :i | new at: i put: (components at: i) ].
  ^ new