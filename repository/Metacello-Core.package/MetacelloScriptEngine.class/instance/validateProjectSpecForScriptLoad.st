project lookup
validateProjectSpecForScriptLoad
    | issues |
    issues := self projectSpec validateForScriptLoad: self withDefaultVersionString: #'stable'.
    issues isEmpty
        ifTrue: [ ^ self ].
    (MetacelloValidationFailure issues: issues message: 'Project spec validation failure') signal