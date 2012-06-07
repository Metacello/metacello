private
validateProjects: specArrays
    | registrySize |
    registrySize := specArrays size.
    specArrays
        do: [ :array | 
            self
                validate: (array at: 1)
                registrySize: registrySize
                expectedConfigurationVersion: (array at: 2)
                expectedConfigurationRepository: (array at: 3)
                expectedBaselineVersion: (array at: 4)
                expectedBaselineRepository: (array at: 5) ]