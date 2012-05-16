accessing
projectClass
    projectClass ifNil: [ projectClass := self repositorySpec createRepository metacelloProjectClassFor: self ].
    ^ projectClass