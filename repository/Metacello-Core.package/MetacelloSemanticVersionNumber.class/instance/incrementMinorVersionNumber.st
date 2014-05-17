operations
incrementMinorVersionNumber
  | int col |
  col := self normalVersion.
  col size to: 1 by: -1 do: [ :index | 
    int := col at: index.
    col at: index put: int + 1.
    ^ self ]