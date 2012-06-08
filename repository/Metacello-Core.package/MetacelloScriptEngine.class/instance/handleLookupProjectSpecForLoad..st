handlers
handleLookupProjectSpecForLoad: exception
    "if overrideProjectSpec is nil, use currentVersion in image, ignoreImage is false"

    ^ exception
        resume:
            (MetacelloProjectSpecForLoad new
                projectSpec: exception projectSpec;
                overrideProjectSpec:
                        (self ignoreImage
                                ifTrue: [ self lookupProjectSpecFor: exception projectSpec ]
                                ifFalse: [ 
                                    "force use of determineVersionForLoad and  use image state for currentVersion calculation"
                                    nil ]);
                yourself)