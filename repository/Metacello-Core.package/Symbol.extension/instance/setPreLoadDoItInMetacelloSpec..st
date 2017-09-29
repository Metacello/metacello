*metacello-core
setPreLoadDoItInMetacelloSpec: aMetacelloSpec
  self size = 0
    ifTrue: [ self error: 'Invalid selector' ].
  aMetacelloSpec
    setPreLoadDoIt:
      (aMetacelloSpec project valueHolderSpec
        value: self;
        yourself)
