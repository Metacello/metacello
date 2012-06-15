registration
registerProject
    "unconditionally register <newRegistration> ... use with care"

    self configurationProjectSpec
        ifNotNil: [ :spec | 
            self class configurationRegistry
                at: spec className
                ifPresent: [ :existing | 
                    (existing configurationProjectSpec registrationsCompareEqual: spec)
                        ifFalse: [ self error: 'unexpected existing project registration' ] ].
            self class configurationRegistry at: spec className put: self ].
    self baselineProjectSpec
        ifNotNil: [ :spec | 
            self class baselineRegistry
                at: spec className
                ifPresent: [ :existing | 
                    (existing baselineProjectSpec registrationsCompareEqual: spec)
                        ifFalse: [ self error: 'unexpected existing project registration' ] ].
            self class baselineRegistry at: spec className put: self ]