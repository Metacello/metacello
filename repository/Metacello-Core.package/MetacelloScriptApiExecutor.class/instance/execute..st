execution
execute: statements
    super execute: statements.
    ^ self roots size == 1
        ifTrue: [ self roots first ]
        ifFalse: [ self roots ]