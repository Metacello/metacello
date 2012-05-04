project lookup
lookupConfigurationPackageSpecFrom: aPackageSpec
    | configurationGofer packageSpec |
    true
        ifTrue: [ 
            "this is all about looking things up from the repository path ... and I've decide that the path isn't useful at the moment"
            ^ aPackageSpec ].
    (configurationGofer := self lookupConfigurationGofer: aPackageSpec file) ifNil: [ ^ aPackageSpec ].
    packageSpec := aPackageSpec copy
        repositories: nil;
        yourself.
    configurationGofer repositories
        do: [ :repo | packageSpec repository: (repo asRepositorySpecFor: packageSpec project) ].
    ^ packageSpec