accessing
projectPackage
    projectPackage
        ifNil: [ 
            projectPackage := self project packageSpec.
            projectPackage name: self name.
            projectPackage repositories: self getRepositories ].
    ^ projectPackage