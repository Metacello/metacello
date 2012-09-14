deploy
release: aVersionString from: sourceRepository to: targetRepositories
    | project |
    project := ConfigurationOfMetacello project.
    self new
        deployVersion: (project version: aVersionString) from: sourceRepository to: targetRepositories;
        releaseProject: project
            version: aVersionString
            from: sourceRepository
            to: targetRepositories