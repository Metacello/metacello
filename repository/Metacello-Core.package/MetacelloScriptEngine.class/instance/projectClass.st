accessing
projectClass
    | repository |
    projectClass
        ifNil: [ 
            projectClass := (self repositoryDescription beginsWith: 'github://')
                ifTrue: [ MetacelloGitHubProject ]
                ifFalse: [ self repositorySpec createRepository metacelloProjectClass ] ].
    ^ projectClass