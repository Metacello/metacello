registration
unregisterProjectSpecs: projectSpecRegistry
    self configurationProjectSpec
        ifNotNil: [ :spec | projectSpecRegistry removeKey: spec className ifAbsent: [ self error: 'unexpectedly missing projectSpec' ] ].
    self baselineProjectSpec
        ifNotNil: [ :spec | projectSpecRegistry removeKey: spec className ifAbsent: [ self error: 'unexpectedly missing projectSpec' ] ]