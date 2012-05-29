baseline:with:
setUpVersionBaselineOfExternalXdkh2: ancestors
    "self reset"

    | reference className definitionArray versionInfo |
    reference := GoferVersionReference name: 'ConfigurationOfExternalX-dkh.2'.
    className := #'ConfigurationOfExternalX'.
    definitionArray := {(MCClassDefinition
        name: className
        superclassName: #'MetacelloBaseConfiguration'
        category: reference packageName
        instVarNames: #()
        comment: '').
    (MCMethodDefinition
        className: className asString
        classIsMeta: false
        selector: 'versionOfX090:'
        category: 'cat'
        timeStamp: ''
        source: (self class sourceCodeAt: #'versionOfX090:') asString).
    (MCMethodDefinition
        className: className asString
        classIsMeta: false
        selector: 'versionOfX091:'
        category: 'cat'
        timeStamp: ''
        source: (self class sourceCodeAt: #'versionOfX091:') asString).
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
                        ancestors: ancestors)
                snapshot: (MCSnapshot fromDefinitions: definitionArray)
                dependencies: #()).
    ^ versionInfo