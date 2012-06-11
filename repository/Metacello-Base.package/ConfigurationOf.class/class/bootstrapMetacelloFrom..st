private
bootstrapMetacelloFrom: repositoryUrl
    "Corresponds to version 1.0-beta.32"

    | platformPkg |
    self ensureGoferVersion: 'Gofer-Core-lr.115' repositoryUrl: repositoryUrl.
    #('Metacello-Base-dkh.57' 'Metacello-Core-dkh.578' 'Metacello-MC-dkh.619' 'ConfigurationOfMetacello-dkh.680')
        do: [ :pkg | self bootstrapPackage: pkg from: repositoryUrl ].
    platformPkg := Smalltalk
        at: #'SystemVersion'
        ifPresent: [ :cl | 
            | versionString |
            versionString := cl current version.
            (versionString beginsWith: 'Squeak')
                ifTrue: [ 
                    (versionString beginsWith: 'Squeak3')
                        ifTrue: [ 'Metacello-Platform.squeak-dkh.5' ]
                        ifFalse: [ 'Metacello-Platform.squeak-dkh.10' ] ]
                ifFalse: [ 
                    (versionString beginsWith: 'Pharo')
                        ifTrue: [ 'Metacello-Platform.pharo-DaleHenrichs.25' ] ] ].
    self bootstrapPackage: platformPkg from: repositoryUrl