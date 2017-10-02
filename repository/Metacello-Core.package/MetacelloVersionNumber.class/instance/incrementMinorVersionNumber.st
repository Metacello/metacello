operations
incrementMinorVersionNumber
  | int platform |
  platform := MetacelloPlatform current.
  self size to: 1 by: -1 do: [ :index | 
    (platform isString: (int := self at: index))
      ifFalse: [ 
        self at: index put: int + 1.
        ^ self ] ]
