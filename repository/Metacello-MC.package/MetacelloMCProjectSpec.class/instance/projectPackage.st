accessing
projectPackage
    projectPackage
        ifNil: [ 
            projectPackage := self project packageSpec.
            projectPackage name: self className.
            self getFile ifNotNil: [ projectPackage file: self file ].
            projectPackage repositories: self getRepositories ].
    ^ projectPackage