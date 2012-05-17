version:baselineOf: pragma
setUpVersionBaselineOfExternalXXX
    "self reset"

    | reference className definitionArray versionInfo |
    reference := GoferVersionReference name: 'ConfigurationOfExternalXXX-dkh.1'.
    className := #'ConfigurationOfExternalXXX'.
    definitionArray := {(MCClassDefinition
        name: className
        superclassName: #'MetacelloBaseConfiguration'
        category: reference packageName
        instVarNames: #()
        comment: '').
    (MCMethodDefinition
        className: className asString
        classIsMeta: false
        selector: 'versionOfXXX:'
        category: 'cat'
        timeStamp: ''
        source: (self class sourceCodeAt: #'versionOfXXX:') asString)}.
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