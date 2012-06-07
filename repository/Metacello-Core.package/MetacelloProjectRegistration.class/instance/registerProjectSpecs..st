registration
registerProjectSpecs: projectSpecRegistry
    self configurationProjectSpec
        ifNotNil: [ :spec | 
            projectSpecRegistry
                at: spec className
                ifPresent: [ :existing | 
                    (existing configurationProjectSpec registrationsCompareEqual: self configurationProjectSpec)
                        ifFalse: [ self error: 'duplicate configuration registrations' ] ].
            projectSpecRegistry at: spec className put: self ].
    self baselineProjectSpec
        ifNotNil: [ :bSpec | 
            projectSpecRegistry
                at: bSpec className
                ifPresent: [ :existing | 
                    (existing baselineProjectSpec registrationsCompareEqual: self baselineProjectSpec)
                        ifFalse: [ self error: 'duplicate baseline registrations' ] ].
            projectSpecRegistry at: bSpec className put: self ]