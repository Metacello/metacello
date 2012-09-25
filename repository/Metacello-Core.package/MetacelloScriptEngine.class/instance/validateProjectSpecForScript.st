project lookup
validateProjectSpecForScript
    | issues |
    issues := self projectSpec
        validateForScriptLoad: self
        withDefaultVersionString: self defaultVersionString
        withDefaultRepositoryDecription: self defaultRepositoryDescription.
    issues isEmpty
        ifTrue: [ ^ self ].
    (MetacelloValidationFailure issues: issues message: 'Project spec validation failure') signal