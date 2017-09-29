private
incrementVersionAt: index
  | int platform |
  platform := MetacelloPlatform current.
  int := self at: index.
  (platform isString: (int := self at: index))
    ifFalse: [ self at: index put: int + 1 ]
