accessing
projectClass
    | repository |
    projectClass ifNil: [ projectClass := self repositorySpec createRepository metacelloProjectClass ].
    ^ projectClass