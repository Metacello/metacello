registration
unregisterProject
    self configurationProjectSpec
        ifNotNil: [ :spec | 
            self class configurationRegistry
                removeKey: spec className
                ifAbsent: [ self error: 'unexpectedly missing project registration' ] ].
    self baselineProjectSpec
        ifNotNil: [ :spec | 
            self class baselineRegistry
                removeKey: spec className
                ifAbsent: [ self error: 'unexpectedly missing project registration' ] ]