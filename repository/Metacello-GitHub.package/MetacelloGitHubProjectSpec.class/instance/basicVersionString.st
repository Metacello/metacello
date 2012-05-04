accessing
basicVersionString
    "good bet that we're using a MCGitHubRepository spec"

    versionString ifNotNil: [ ^ super basicVersionString ].
    ^ (MCGitHubRepository parseLocation: self repository description version: nil) projectVersion