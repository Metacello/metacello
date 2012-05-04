accessing
repository: aString
    (aString beginsWith: MCGitHubRepository description)
        ifFalse: [ ^ self error: 'repository spec for github project must be a github repository' ].
    super repository: aString