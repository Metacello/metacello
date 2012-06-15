handlers
handleLookupProjectSpecForLoad: exception
    "if overrideProjectSpec is nil, use currentVersion in image, ignoreImage is false"

    | existing new override |
    existing := exception projectSpec.
    override := self useCurrentVersion
        ifTrue: [ 
            "don't do lookup in registry if we expect to use the #currentVersion calculation"
            nil ]
        ifFalse: [ 
            new := self lookupProjectSpecFor: exception projectSpec.
            (new compareEqual: existing)
                ifFalse: [ 
                    "counts as override, only if they differ in some aspect"
                    override := new ] ].
    ^ exception
        resume:
            (MetacelloProjectSpecForLoad new
                projectSpec: existing;
                useDetermineVersionForLoad: self useCurrentVersion;
                overrideProjectSpec: override;
                yourself)