private
bootstrapMetacelloFrom: repositoryUrl
    "Corresponds to version 1.0-beta.29"

    | platformPkg |
    self ensureGoferVersion: 'Gofer-Core-lr.115' repositoryUrl: repositoryUrl.
    #('Metacello-Base-DaleHenrichs.19' 'Metacello-Core-dkh.465' 'Metacello-MC-dkh.522')
        do: [ :pkg | self bootstrapPackage: pkg from: repositoryUrl ].
    platformPkg := Smalltalk
        at: #SystemVersion
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
                        ifTrue: [ 'Metacello-Platform.pharo-dkh.27' ] ] ].
    self bootstrapPackage: platformPkg from: repositoryUrl