printing
printOn: aStream
    | label versionString |
    self
        configurationProjectSpecIfPresent: [ :spec | 
            label := spec className.
            versionString := spec versionString ]
        ifAbsent: [ 
            "baseline"
            label := self baselineProjectSpec className.
            versionString := '[baseline]' ].
    aStream
        nextPutAll: label;
        space;
        nextPutAll: versionString;
        nextPutAll: ' from ' , self repository description