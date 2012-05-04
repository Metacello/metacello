instance creation
fromStream: aStream projectClass: projectClass
    | project dict sections specSelectors |
    dict := (MCFileTreeJsonParser parseStream: aStream) first.
    project := projectClass new.
    sections := OrderedCollection new.
    specSelectors := Dictionary new
        at: 'project' put: #'projectReferenceSpec';
        at: 'github' put: #'githubProjectReferenceSpec';
        at: 'package' put: #'packageSpec';
        at: 'group' put: #'groupSpec';
        yourself.
    (dict at: 'baseline')
        do: [ :versionDict | 
            versionDict
                keysAndValuesDo: [ :attribute :specList | 
                    | section |
                    section := MetacelloVersionMethodSection new
                        attribute: attribute;
                        versionSpec: project versionSpec;
                        yourself.
                    sections add: section.
                    specList
                        do: [ :specDict | 
                            specDict
                                keysAndValuesDo: [ :specType :fieldDict | 
                                    | spec memberSelector sourceName |
                                    spec := project perform: (specSelectors at: specType).
                                    sourceName := nil.
                                    memberSelector := #'merge:'.
                                    fieldDict
                                        keysAndValuesDo: [ :selector :value | 
                                            selector = 'override'
                                                ifTrue: [ 
                                                    value
                                                        ifTrue: [ memberSelector := #'add:' ] ]
                                                ifFalse: [ 
                                                    selector = 'remove'
                                                        ifTrue: [ 
                                                            value
                                                                ifTrue: [ memberSelector := #'remove:' ] ]
                                                        ifFalse: [ 
                                                            selector = 'copyFrom'
                                                                ifTrue: [ 
                                                                    sourceName := value.
                                                                    memberSelector := #'copy:to:' ]
                                                                ifFalse: [ 
                                                                    (self allowedJsonFieldNames includes: selector)
                                                                        ifFalse: [ self error: selector printString , ' is an invalid field name for Metacello JSON file format' ].
                                                                    spec
                                                                        perform: selector asSymbol asMutator
                                                                        with: value ] ] ] ].
                                    sourceName == nil
                                        ifTrue: [ section versionSpec packages perform: memberSelector with: spec ]
                                        ifFalse: [ section versionSpec packages perform: memberSelector with: sourceName with: spec ] ] ] ] ].
    ^ (MetacelloFileTreeConstructor new
        projectClass: projectClass;
        methodSections: sections) createProject