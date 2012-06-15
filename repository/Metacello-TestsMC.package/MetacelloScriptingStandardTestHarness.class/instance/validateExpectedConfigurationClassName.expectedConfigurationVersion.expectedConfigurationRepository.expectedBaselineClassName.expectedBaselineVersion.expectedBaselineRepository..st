utilities
validateExpectedConfigurationClassName: expectedConfigurationClassName expectedConfigurationVersion: expectedConfigurationVersion expectedConfigurationRepository: expectedConfigurationRepository expectedBaselineClassName: expectedBaselineClassName expectedBaselineVersion: expectedBaselineVersion expectedBaselineRepository: expectedBaselineRepository
    MetacelloProjectRegistration configurationRegistry
        at: expectedConfigurationClassName
        ifPresent: [ :existing | 
            | spec x |
            spec := existing configurationProjectSpec.
            self assert: (x := spec versionString) = expectedConfigurationVersion.
            self assert: spec repository description = expectedConfigurationRepository ]
        ifAbsent: [ self assert: expectedConfigurationVersion == nil ].
    MetacelloProjectRegistration baselineRegistry
        at: expectedBaselineClassName
        ifPresent: [ :existing | 
            | spec |
            spec := existing baselineProjectSpec.
            self assert: spec versionString = expectedBaselineVersion.
            self assert: spec repository description = expectedBaselineRepository ]
        ifAbsent: [ self assert: expectedBaselineVersion == nil ]