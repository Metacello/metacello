*metacello-core
setPostLoadDoItInMetacelloSpec: aMetacelloSpec
  self size = 0
    ifTrue: [ self error: 'Invalid selector' ].
  aMetacelloSpec
    setPostLoadDoIt:
      (aMetacelloSpec project valueHolderSpec
        value: self;
        yourself)
