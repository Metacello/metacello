external repository
setUpBaselineGithubReference
    "self reset"

    | reference className definitionArray versionInfo |
    reference := GoferVersionReference name: 'BaselineOfGithubRef-dkh.1'.
    className := #'BaselineOfGithubRef'.
    definitionArray := {(MCClassDefinition
        name: className
        superclassName: #'MetacelloBaseBaselineConfiguration'
        category: reference packageName
        instVarNames: #()
        comment: '').
    (MCMethodDefinition
        className: className asString
        classIsMeta: false
        selector: 'baselineGithubReference:'
        category: 'cat'
        timeStamp: ''
        source: (self class sourceCodeAt: #'baselineGithubReference:') asString)}.
    externalRepository
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