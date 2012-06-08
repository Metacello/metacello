handlers
handleLookupProjectSpecForLoad: exception
    "don't look up currentVersion in image"

    ^ exception
        resume:
            (MetacelloProjectSpecForLoad new
                projectSpec: exception projectSpec;
                overrideProjectSpec: (self lookupProjectSpecFor: exception projectSpec);
                yourself)