execution
execute: statements
    | engine |
    statements
        do: [ :assoc | assoc value ifNil: [ self perform: assoc key ] ifNotNil: [ self perform: assoc key withArguments: assoc value ] ].
    self roots
        add:
            ((MetacelloScriptEngine new
                options: self options;
                projectSpec: self constructProjectSpec;
                yourself) perform: actionArg key withArguments: actionArg value) root.
    ^ self roots size == 1
        ifTrue: [ self roots first ]
        ifFalse: [ self roots ]