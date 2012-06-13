printing
printOn: aStream
    self
        configurationProjectSpecIfPresent: [ 
            aStream
                nextPutAll: self projectName;
                space;
                nextPutAll: self version ]
        ifAbsent: [ 
            "baseline"
            aStream
                nextPutAll: self projectName;
                space;
                nextPutAll: '[baseline]' ].
    aStream nextPutAll: ' from ' , self repository description