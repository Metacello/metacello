accessing
directory
    directory
        ifNil: [ 
            directory := self class projectDirectoryFrom: self projectPath version: self projectVersion.
            self repoPath ifNotNil: [ directory := MetacelloPlatform current directoryFromPath: self repoPath relativeTo: directory ] ].
    ^ directory