scripting
validateVersionString: issues withDefaultVersionString: ignored
    self versionString
        ifNotNil: [ :vs | 
            vs ~= self project singletonVersionName
                ifTrue: [ 
                    issues
                        add:
                            (MetacelloValidationError
                                configurationClass: self projectClass
                                reasonCode: #'invalidVersionString'
                                callSite: #'validateVersionString:withDefaultVersionString:'
                                explanation:
                                    'version field is incorrect, should be: ' , self project singletonVersionName printString) ] ]