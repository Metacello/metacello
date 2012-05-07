printing
configMethodOn: aStream indent: indent
    aStream
        tab: indent;
        nextPutAll: 'spec ';
        cr;
        tab: indent + 1;
        nextPutAll: 'baseline: ' , self name printString;
        nextPutAll: ' with: ' , self repositorySpecs first description , '.'