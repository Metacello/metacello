registration
validateProjectSpecsRegistration: projectSpecRegistry
    self configurationProjectSpec
        ifNotNil: [ :spec | projectSpecRegistry at: spec className ifAbsent: [ self error: 'missing configuration registrations' ] ].
    self baselineProjectSpec
        ifNotNil: [ :spec | projectSpecRegistry at: spec className ifAbsent: [ self error: 'missing baseline registrations' ] ]