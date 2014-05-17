operations
decrementMinorVersionNumber
  | int col |
  col := self normalVersion.
  col size to: 1 by: -1 do: [ :index | 
    int := col at: index.
    int > 0
      ifTrue: [ col at: index put: int - 1 ].
    ^ self ]