execution
applyArgsToProjectSpec: aProjectSpec
    classNameArg ifNotNil: [ aProjectSpec className: classNameArg ].
    versionArg ifNotNil: [ aProjectSpec versionString: versionArg ].
    repositoryArg ifNotNil: [ aProjectSpec repository: repositoryArg ].
    usernameArg ifNotNil: [ aProjectSpec username: usernameArg ].
    passwordArg ifNotNil: [ aProjectSpec password: passwordArg ].
    ^ aProjectSpec