handlers
handleLookupProjectSpecForLoad: exception
    "if overrideProjectSpec is nil, use currentVersion in image"

    ^ exception
        resume:
            (MetacelloProjectSpecForLoad new
                projectSpec: exception projectSpec;
                overrideProjectSpec:
                        (self classic
                                ifTrue: [ nil ]
                                ifFalse: [ self lookupProjectSpecFor: exception projectSpec ]);
                yourself)