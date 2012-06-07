project lookup
validateProjectSpec: validationSelector
    | issues |
    issues := self projectSpec perform: validationSelector with: self.
    issues isEmpty
        ifTrue: [ ^ self ].
    (MetacelloValidationFailure issues: issues message: 'Project spec validation failure') signal