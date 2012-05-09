private
with: aMetacelloSpec during: aBlock
    | previousRoot previousFilter |
    previousRoot := self root.
    previousFilter := self filter.
    self root: aMetacelloSpec.
    self
        filter:
            (filter := aMetacelloSpec constructorFilterClass new
                constructor: self;
                yourself).
    aBlock
        ensure: [ 
            self root: previousRoot.
            self filter: previousFilter ]