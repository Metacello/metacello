utilities
getTestRepositoryDirectory
    | wc fileTreeRepo |
    MCWorkingCopy registry
        do: [ :mgr | 
            (mgr packageInfo includesClass: self class)
                ifTrue: [ wc := mgr ] ].
    wc ifNil: [ ^ self assert: false ].
    fileTreeRepo := (wc repositoryGroup repositories reject: [ :repo | MCCacheRepository default = repo ])
        detect: [ :repo | repo isKindOf: MCFileTreeRepository ].
    ^ fileTreeRepo directory containingDirectory directoryNamed: 'tests/repositories/issue111Packages'