accessing
createProject
    | map versionSpec |
    project := self projectClass new.
    map := Dictionary new.
    self methodSections do: [ :section | map at: section attribute asSymbol put: section ].
    project attributes
        do: [ :attribute | 
            | section |
            section := map at: attribute ifAbsent: [  ].
            section
                ifNotNil: [ 
                    versionSpec == nil
                        ifTrue: [ versionSpec := section versionSpec copy ]
                        ifFalse: [ versionSpec := versionSpec mergeSpec: section versionSpec copy ] ] ].
    versionSpec
        ifNotNil: [ 
            | version versionMap |
            versionSpec versionString: 'baseline'.
            version := versionSpec createVersion.
            versionMap := Dictionary new.
            versionMap at: version versionString put: version.
            project map: versionMap ].
    ^ project