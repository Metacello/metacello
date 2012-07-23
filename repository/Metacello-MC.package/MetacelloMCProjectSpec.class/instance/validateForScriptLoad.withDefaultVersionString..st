scripting
validateForScriptLoad: aScriptEngine withDefaultVersionString: defaultVersionString
    | issues |
    issues := OrderedCollection new.
    self name
        ifNil: [ 
            issues
                add:
                    (MetacelloValidationError
                        configurationClass: self projectClass
                        reasonCode: #'incompleteProjectSpec'
                        callSite: #'validateForScriptLoad:withDefaultVersionString:'
                        explanation: 'name field required') ].
    self className
        ifNil: [ 
            issues
                add:
                    (MetacelloValidationError
                        configurationClass: self projectClass
                        reasonCode: #'incompleteProjectSpec'
                        callSite: #'validateForScriptLoad:withDefaultVersionString:'
                        explanation: 'className field required') ].
    self repositories isEmpty
        ifTrue: [ 
            issues
                add:
                    (MetacelloValidationError
                        configurationClass: self projectClass
                        reasonCode: #'incompleteProjectSpec'
                        callSite: #'validateForScriptLoad:withDefaultVersionString:'
                        explanation: 'repository field required') ].
    self versionString
        ifNil: [ 
            defaultVersionString
                ifNotNil: [ self versionString: defaultVersionString ]
                ifNil: [ 
                    issues
                        add:
                            (MetacelloValidationError
                                configurationClass: self projectClass
                                reasonCode: #'incompleteProjectSpec'
                                callSite: #'validateForScriptLoad:withDefaultVersionString:'
                                explanation: 'version field required') ] ].
    ^ issues