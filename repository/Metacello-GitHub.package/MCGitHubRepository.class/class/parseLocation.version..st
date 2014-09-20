private
parseLocation: locationUrl version: versionString
  "self 
	parseLocation: 'github://dalehenrich/MetacelloRepository:master/monticello/repos/itory/path'
	version: nil
     "

  | projectPath projectVersion repoPath headerSize desc projectDelim repoDelim versionDelim |
  headerSize := 'github://' size.
  desc := locationUrl.
  desc := desc copyFrom: headerSize + 1 to: desc size.
  projectVersion := repoPath := nil.
  projectDelim := desc indexOf: $/.
  repoDelim := desc indexOf: $/ startingAt: projectDelim + 1.
  (versionDelim := desc indexOf: $:) == 0
    ifTrue: [ 
      repoDelim == 0
        ifTrue: [ projectPath := desc ]
        ifFalse: [ 
          projectPath := desc copyFrom: 1 to: repoDelim - 1.
          repoPath := desc copyFrom: repoDelim + 1 to: desc size ] ]
    ifFalse: [ 
      projectPath := desc copyFrom: 1 to: versionDelim - 1.
      repoDelim == 0
        ifTrue: [ projectVersion := desc copyFrom: versionDelim + 1 to: desc size ]
        ifFalse: [ 
          | strm done escaped |
          "Issue #234: have to allow for commitish containing slashes"
          strm := WriteStream on: String new.
          repoDelim := versionDelim + 1.
          escaped := done := false.
          [ done ]
            whileFalse: [ 
              | char |
              repoDelim > desc size
                ifTrue: [ done := true ]
                ifFalse: [ 
                  char := desc at: repoDelim.
                  char == $\
                    ifTrue: [ 
                      escaped
                        ifTrue: [ 
                          strm nextPut: char.
                          escaped := false ]
                        ifFalse: [ escaped := true ] ]
                    ifFalse: [ 
                      char == $/
                        ifTrue: [ 
                          escaped
                            ifFalse: [ done := true ] ].
                      done
                        ifFalse: [ strm nextPut: char ].
                      escaped := false ].
                  repoDelim := repoDelim + 1 ] ].
          repoDelim := repoDelim - 1.
          projectVersion := strm contents.
          repoPath := desc copyFrom: repoDelim + 1 to: desc size ] ].
  versionString ~~ nil
    ifTrue: [ projectVersion := versionString ].
  ^ self new
    projectPath: projectPath;
    projectVersion: projectVersion;
    repoPath: repoPath;
    yourself