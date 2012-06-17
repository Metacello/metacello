accessing
directory
    directory
        ifNil: [ 
            directory := self class projectDirectoryFrom: self projectPath version: self projectVersion.
            self repoPath ifNotNil: [ directory := FileDirectory on: (directory fullNameFor: self repoPath) ] ].
    ^ directory