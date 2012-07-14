execution
execute: statements
    | engine |
    statements
        do: [ :assoc | assoc value ifNil: [ self perform: assoc key ] ifNotNil: [ self perform: assoc key withArguments: assoc value ] ].
    self
        projectSpecsDo: [ :projectSpec | 
            self roots
                add:
                    ((MetacelloScriptEngine new
                        options: self options copy;
                        projectSpec: (self applyArgsToProjectSpec: projectSpec copy);
                        yourself) perform: actionArg key withArguments: actionArg value) root ].
    ^ self roots