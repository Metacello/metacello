testing
isValid
    " has a name and one or the other of the projectSpecs is non-nil"

    projectName ifNil: [ ^ false ].
    ^ configurationProjectSpec notNil or: [ baselineProjectSpec notNil ]