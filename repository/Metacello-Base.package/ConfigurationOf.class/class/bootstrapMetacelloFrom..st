private
bootstrapMetacelloFrom: repositoryUrl
    "Corresponds to version 1.0-beta.32.2"

    "KEEP MetacelloConfigTemplate class>>ensureMetacelloBaseConfiguration in synch!"

    | platformPkg |
    self ensureGoferVersion: 'Gofer-Core-lr.115' repositoryUrl: repositoryUrl.
    #('Metacello-Base-dkh.72' 'Metacello-Core-dkh.599' 'Metacello-MC-dkh.627' 'ConfigurationOfMetacello-dkh.697')
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
                        ifTrue: [ 'Metacello-Platform.pharo-DaleHenrichs.27' ] ] ].
    self bootstrapPackage: platformPkg from: repositoryUrl