running
tearDown
    | aGofer |
    super tearDown.
    aGofer := Gofer new.
    self tearDownPackages: aGofer.
    aGofer references notEmpty
        ifTrue: [ aGofer metacelloUnload ].
    MCRepositoryGroup default removeRepository: MetacelloScriptingResource current externalRepository