loading
performLoad
    | displayString spec |
    spec := self projectSpec.
    displayString := 'Project: ' , spec name.
    spec versionString ~~ nil
        ifTrue: [ displayString := displayString , ' ' , spec versionString ].
    Transcript
        cr;
        show: displayString.
    self hasOverride
        ifTrue: [ 
            | override |
            override := self overrideProjectSpec copy.
            override setLoads: spec loads.
            override loadVersion: nil ]
        ifFalse: [ spec loadVersion: spec determineCurrentVersionForLoad ]