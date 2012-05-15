accessing
projectClass
    | repository |
    projectClass
        ifNil: [ 
            projectClass := (self repositoryDescription beginsWith: 'github://')
                ifTrue: [ MetacelloMCBaselineProject ]
                ifFalse: [ self repositorySpec createRepository metacelloProjectClass ] ].
    ^ projectClass