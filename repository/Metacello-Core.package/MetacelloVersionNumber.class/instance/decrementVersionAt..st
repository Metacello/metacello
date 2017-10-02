private
decrementVersionAt: index
  | int platform |
  platform := MetacelloPlatform current.
  int := self at: index.
  (platform isString: (int := self at: index))
    ifFalse: [ 
      int > 0
        ifTrue: [ self at: index put: int - 1 ] ]
