project lookup
validateProjectSpecForScriptLoad
    | issues |
    issues := self projectSpec validateForScriptLoad: self withDefaultVersionString: self defaultVersionString.
    issues isEmpty
        ifTrue: [ ^ self ].
    (MetacelloValidationFailure issues: issues message: 'Project spec validation failure') signal