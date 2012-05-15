accessing
projectPackage
    projectPackage
        ifNil: [ 
            projectPackage := self project packageSpec.
            projectPackage name: self className.
            self getFile ifNotNil: [ projectPackage file: self file ].
            self getRepositories
                do: [ :repoSpec | 
                    self versionString isEmptyOrNil
                        ifTrue: [ projectPackage repositories: self getRepositories ]
                        ifFalse: [ 
                            projectPackage
                                repository:
                                    ((repoSpec createRepository projectVersion: self versionString) asRepositorySpecFor: self project) ] ] ].
    ^ projectPackage