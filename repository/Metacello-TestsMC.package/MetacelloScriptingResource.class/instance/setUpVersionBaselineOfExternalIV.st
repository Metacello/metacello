baseline:with:
setUpVersionBaselineOfExternalIV
    "see https://github.com/dalehenrich/metacello-work/issues/6"

    "self reset"

    | reference className definitionArray versionInfo |
    reference := GoferVersionReference name: 'ConfigurationOfExternalIV-dkh.1'.
    className := #'ConfigurationOfExternalIV'.
    definitionArray := {(MCClassDefinition
        name: className
        superclassName: #'MetacelloBaseConfiguration'
        category: reference packageName
        instVarNames: #()
        comment: '').
    (MCMethodDefinition
        className: className asString
        classIsMeta: false
        selector: 'baselineOfIV:'
        category: 'cat'
        timeStamp: ''
        source: (self class sourceCodeAt: #'baselineOfIV:') asString).
    (MCMethodDefinition
        className: className asString
        classIsMeta: false
        selector: 'customProjectAttributes'
        category: 'cat'
        timeStamp: ''
        source: (self class sourceCodeAt: #'customProjectAttributes') asString)}.
    configurationRepository
        basicStoreVersion:
            (MCVersion new
                setPackage: (MetacelloTestsMCPackage new name: reference packageName)
                info:
                    (versionInfo := MCVersionInfo
                        name: reference name
                        id: UUID new
                        message: 'This is a mock version'
                        date: Date today
                        time: Time now
                        author: reference author
                        ancestors: #())
                snapshot: (MCSnapshot fromDefinitions: definitionArray)
                dependencies: #()).
    ^ versionInfo