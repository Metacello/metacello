loading
load
    | displayString |
    displayString := 'Project: ' , self name.
    self versionString ~~ nil
        ifTrue: [ displayString := displayString , ' ' , self versionString ].
    Transcript
        cr;
        show: displayString.
    self ensureProjectLoaded.
    (MetacelloLookupProjectSpecNotification new
        projectSpec: self;
        yourself) signal privateLoad