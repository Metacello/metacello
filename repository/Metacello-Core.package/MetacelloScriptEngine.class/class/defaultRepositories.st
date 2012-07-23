defaults
defaultRepositories
    DefaultRepositories ifNil: [ DefaultRepositories := MetacelloMCProject new repositoriesSpec repository: '' ].
    ^ DefaultRepositories