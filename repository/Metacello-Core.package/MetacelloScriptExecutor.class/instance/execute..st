execution
execute: statements
    | engine |
    statements
        do: [ :assoc | assoc value ifNil: [ self perform: assoc key ] ifNotNil: [ self perform: assoc key withArguments: assoc value ] ].
    projectSpecGenerator := self projectSpecGenerator.
    projectSpecGenerator target
        execute: [ :projectSpec | 
            self roots
                add:
                    ((MetacelloScriptEngine new
                        options: self options copy;
                        projectSpec: (self applyArgsToProjectSpec: projectSpec copy);
                        yourself) perform: actionArg key withArguments: actionArg value) root ]
        against: self.
    ^ self roots