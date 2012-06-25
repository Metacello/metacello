private
bootstrapMetacelloFrom: repositoryUrl
    "Corresponds to version 1.0-beta.32.2"

    "KEEP MetacelloConfigTemplate class>>ensureMetacelloBaseConfiguration in synch!"

    | platformPkg |
    self ensureGoferVersion: 'Gofer-Core-lr.115' repositoryUrl: repositoryUrl.
    #('Metacello-Base-dkh.76' 'Metacello-Core-dkh.604' 'Metacello-MC-dkh.629')
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
                        ifFalse: [ 'Metacello-Platform.squeak-dkh.13' ] ]
                ifFalse: [ 
                    (versionString beginsWith: 'Pharo')
                        ifTrue: [ 'Metacello-Platform.pharo-dkh.27' ] ] ].
    self bootstrapPackage: platformPkg from: repositoryUrl