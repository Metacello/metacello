private
execute: statements
    statements
        do: [ :assoc | assoc value ifNil: [ self perform: assoc key ] ifNotNil: [ self perform: assoc key withArguments: assoc value ] ].
    ^ self root