private
parseLocation: locationUrl version: versionString
    "self 
	parseLocation: 'github://dalehenrich/MetacelloRepository:master/monticello/repos/itory/path'
	version: nil
     "

    | projectPath projectVersion repoPath headerSize description projectDelim repoDelim versionDelim |
    headerSize := 'github://' size.
    description := locationUrl.
    description := description copyFrom: headerSize + 1 to: description size.
    projectVersion := repoPath := nil.
    projectDelim := description indexOf: $/.
    repoDelim := description indexOf: $/ startingAt: projectDelim + 1.
    (versionDelim := description indexOf: $:) == 0
        ifTrue: [ 
            repoDelim == 0
                ifTrue: [ projectPath := description ]
                ifFalse: [ 
                    projectPath := description copyFrom: 1 to: repoDelim - 1.
                    repoPath := description copyFrom: repoDelim + 1 to: description size ] ]
        ifFalse: [ 
            projectPath := description copyFrom: 1 to: versionDelim - 1.
            repoDelim == 0
                ifTrue: [ projectVersion := description copyFrom: versionDelim + 1 to: description size ]
                ifFalse: [ 
                    projectVersion := description copyFrom: versionDelim + 1 to: repoDelim - 1.
                    repoPath := description copyFrom: repoDelim + 1 to: description size ] ].
    versionString ~~ nil
        ifTrue: [ projectVersion := versionString ].
    ^ self new
        projectPath: projectPath;
        projectVersion: projectVersion;
        repoPath: repoPath;
        yourself