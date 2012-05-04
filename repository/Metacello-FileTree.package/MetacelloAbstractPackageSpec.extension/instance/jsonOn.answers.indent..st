*metacello-filetree
jsonOn: aStream answers: list indent: indent
    "no cr at end"

    | first |
    list isEmpty
        ifTrue: [ ^ self ].
    aStream
        nextPut: $,;
        cr;
        tab: indent;
        nextPutAll: '"supplyingAnswers" : ['.
    first := true.
    list
        do: [ :ar | 
            first
                ifFalse: [ aStream nextPutAll: ', ' ].
            aStream nextPutAll: '"#( '.
            ar
                do: [ :val | 
                    (val isString or: [ val isNumber or: [ val isSymbol or: [ val isCharacter ] ] ])
                        ifTrue: [ aStream nextPutAll: val printString , ' ' ].
                    val == true
                        ifTrue: [ aStream nextPutAll: 'true ' ].
                    val == false
                        ifTrue: [ aStream nextPutAll: 'false ' ] ].
            aStream nextPutAll: ')"'.
            first := false ].
    aStream nextPutAll: ']'