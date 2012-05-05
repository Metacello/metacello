project lookup
lookupBaselinePackageSpecFrom: aPackageSpec
    | baselineGofer packageSpec |
    true
        ifTrue: [ 
            "this is all about looking things up from the repository path ... and I've decide that the path isn't useful at the moment"
            ^ aPackageSpec ].
    (baselineGofer := self lookupBaselineGofer: aPackageSpec file) ifNil: [ ^ aPackageSpec ].
    packageSpec := aPackageSpec copy
        repositories: nil;
        yourself.
    baselineGofer repositories do: [ :repo | packageSpec repository: (repo asRepositorySpecFor: packageSpec project) ].
    ^ packageSpec