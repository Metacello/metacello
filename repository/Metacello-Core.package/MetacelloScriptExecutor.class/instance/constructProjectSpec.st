args
constructProjectSpec
    | projectSpec |
    projectSpec := self projectSpecFromArgs.
    classNameArg ifNotNil: [ projectSpec className: classNameArg ].
    versionArg ifNotNil: [ projectSpec versionString: versionArg ].
    repositoryArg ifNotNil: [ projectSpec repository: repositoryArg ].
    ^ projectSpec