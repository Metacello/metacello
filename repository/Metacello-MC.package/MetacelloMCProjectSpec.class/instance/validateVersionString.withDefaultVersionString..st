scripting
validateVersionString: issues withDefaultVersionString: defaultVersionString
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
                                callSite: #'validateVersionString:withDefaultVersionString:'
                                explanation: 'version field required') ] ]