querying
projectClass
  self className == nil
    ifTrue: [ ^ nil ].
  ^ MetacelloPlatform current
    globalNamed: self className asSymbol
    ifAbsent: [  ]
