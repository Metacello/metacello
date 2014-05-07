lookup
lookupSpec: aProjectSpec
  self configurationProjectSpec
    ifNotNil: [ :spec | 
      spec className = aProjectSpec className
        ifTrue: [ ^ spec ].
      self locked
        ifTrue: [ ^ nil ] ].
  self baselineProjectSpec
    ifNotNil: [ :spec | 
      spec className = aProjectSpec className
        ifTrue: [ ^ spec ].
      self locked
        ifTrue: [ ^ nil ] ].
  ^ nil
