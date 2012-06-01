registration
registerProjectSpecs: projectSpecRegistry
    self configurationProjectSpec
        ifNotNil: [ :spec | 
            projectSpecRegistry at: spec className ifPresent: [ self error: 'duplicate configuration registrations' ].
            projectSpecRegistry at: spec className put: self ].
    self baselineProjectSpec
        ifNotNil: [ :bSpec | 
            projectSpecRegistry at: bSpec className ifPresent: [ self error: 'duplicate baseline registrations' ].
            projectSpecRegistry at: bSpec className put: self ]