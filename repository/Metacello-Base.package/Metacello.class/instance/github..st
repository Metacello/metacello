api
github: projectPath
    self ensureList add: #'MetacelloGitHubProject' -> 'Metacello-Git'.
    self repository: 'github://' , projectPath