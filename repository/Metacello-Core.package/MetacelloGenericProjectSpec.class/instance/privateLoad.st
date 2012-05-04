private
privateLoad
    | displayString |
    displayString := 'Project: ' , self name.
    self versionString ~~ nil
        ifTrue: [ displayString := displayString , ' ' , self versionString ].
    Transcript
        cr;
        show: displayString.
    self loadVersion: self determineCurrentVersionForLoad