deploy
deployVersion: version from: sourceRepository to: targetRepositories
    | fileNames gofer targetRepository |
    fileNames := self extractFileNamesFrom: version.
    gofer := Gofer new.
    gofer repository: sourceRepository.
    Transcript
        cr;
        show: 'Fetching version: ' , version versionString printString.
    fileNames
        do: [ :fileName | 
            Transcript
                cr;
                tab;
                show: fileName.
            gofer version: fileName ].
    gofer fetch.
    gofer := Gofer new.
    targetRepositories do: [ :repo | gofer repository: repo ].
    Transcript
        cr;
        show: 'Pushing:'.
    fileNames
        do: [ :fileName | 
            Transcript
                cr;
                tab;
                show: fileName.
            gofer version: fileName ].
    gofer push.
    Transcript
        cr;
        show: 'DONE'