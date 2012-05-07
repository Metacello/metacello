printing
configMethodCascadeOn: aStream member: aMember last: lastCascade indent: indent
    "probably wrong..."

    aStream
        cr;
        tab: indent;
        nextPutAll: 'baseline: ' , self name printString;
        nextPutAll: ' with: ' , self repositorySpecs first description printString.
    lastCascade
        ifTrue: [ aStream nextPut: $. ]
        ifFalse: [ 
            aStream
                nextPut: $;;
                cr ]