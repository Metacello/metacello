scripting
validateForScriptLoad: aScriptEngine
    | issues |
    issues := OrderedCollection new.
    self name
        ifNil: [ 
            issues
                add:
                    (MetacelloValidationError
                        configurationClass: self projectClass
                        reasonCode: #'incompleteProjectSpec'
                        callSite: #'validateForScriptLoad:'
                        explanation: 'name field required') ].
    self className
        ifNil: [ 
            issues
                add:
                    (MetacelloValidationError
                        configurationClass: self projectClass
                        reasonCode: #'incompleteProjectSpec'
                        callSite: #'validateForScriptLoad:'
                        explanation: 'className field required') ].
    self repositories isEmpty
        ifTrue: [ 
            issues
                add:
                    (MetacelloValidationError
                        configurationClass: self projectClass
                        reasonCode: #'incompleteProjectSpec'
                        callSite: #'validateForScriptLoad:'
                        explanation: 'repository field required') ].
    self versionString
        ifNil: [ 
            issues
                add:
                    (MetacelloValidationError
                        configurationClass: self projectClass
                        reasonCode: #'incompleteProjectSpec'
                        callSite: #'validateForScriptLoad:'
                        explanation: 'version field required') ].
    ^ issues