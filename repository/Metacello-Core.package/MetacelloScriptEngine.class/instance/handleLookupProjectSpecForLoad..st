handlers
handleLookupProjectSpecForLoad: exception
    "if overrideProjectSpec is nil, use currentVersion in image, ignoreImage is false"

    ^ exception
        resume:
            (MetacelloProjectSpecForLoad new
                projectSpec: exception projectSpec;
                useDetermineVersionForLoad: self useCurrentVersion;
                overrideProjectSpec:
                        (self useCurrentVersion
                                ifTrue: [ 
                                    "don't do lookup in registry if we expect to use the #currentVersion calculation"
                                    nil ]
                                ifFalse: [ self lookupProjectSpecFor: exception projectSpec ]);
                yourself)