deploy
deploy: aVersionString from: sourceRepository to: targetRepositories
    ^ self new
        deployVersion: (ConfigurationOfMetacello project version: aVersionString)
        from: sourceRepository
        to: targetRepositories