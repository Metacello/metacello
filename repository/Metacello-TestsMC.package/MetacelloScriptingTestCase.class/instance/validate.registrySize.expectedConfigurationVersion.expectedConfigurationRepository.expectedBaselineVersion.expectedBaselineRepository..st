utilities
validate: projectName registrySize: registrySize expectedConfigurationVersion: expectedConfigurationVersion expectedConfigurationRepository: expectedConfigurationRepository expectedBaselineVersion: expectedBaselineVersion expectedBaselineRepository: expectedBaselineRepository
    | registry specRegistry registration configurationProjectSpec baselineProjectSpec |
    registry := MetacelloProjectRegistration registry.
    specRegistry := MetacelloProjectRegistration projectSpecRegistry.
    self assert: registry size = registrySize.
    registrySize == 0
        ifTrue: [ ^ self ].
    registration := registry at: projectName.
    registration validateProjectSpecsRegistration: specRegistry.
    configurationProjectSpec := registration configurationProjectSpec.
    baselineProjectSpec := registration baselineProjectSpec.
    expectedConfigurationVersion
        ifNil: [ self assert: configurationProjectSpec == nil ]
        ifNotNil: [ 
            self assert: configurationProjectSpec versionString = expectedConfigurationVersion.
            self assert: configurationProjectSpec repository description = expectedConfigurationRepository.
            specRegistry at: configurationProjectSpec className ifAbsent: [ self assert: false ] ].
    expectedBaselineVersion
        ifNil: [ self assert: baselineProjectSpec == nil ]
        ifNotNil: [ 
            self assert: baselineProjectSpec versionString = expectedBaselineVersion.
            self assert: baselineProjectSpec repository description = expectedBaselineRepository.
            specRegistry at: baselineProjectSpec className ifAbsent: [ self assert: false ] ]