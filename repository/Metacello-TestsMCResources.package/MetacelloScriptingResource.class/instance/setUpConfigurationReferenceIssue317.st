issue 317
setUpConfigurationReferenceIssue317
  "self reset"

  | reference className definitionArray versionInfo |
  reference := GoferVersionReference
    name: 'ConfigurationOfReferenceIssue317-dkh.1'.
  className := #'ConfigurationOfReferenceIssue317'.
  definitionArray := {(MCOrganizationDefinition
    categories: (Array with: reference packageName asSymbol)).
  (MCClassDefinition
    name: className
    superclassName: #'ConfigurationOf'
    category: reference packageName
    instVarNames: #()
    comment: '').
  (MCMethodDefinition
    className: className asString
    classIsMeta: false
    selector: 'issue317ReferenceVersion100:'
    category: 'cat'
    timeStamp: ''
    source: (self class sourceCodeAt: #'issue317ReferenceVersion100:') asString).
  (MCMethodDefinition
    className: className asString
    classIsMeta: false
    selector: 'issue317ReferenceVersion200:'
    category: 'cat'
    timeStamp: ''
    source: (self class sourceCodeAt: #'issue317ReferenceVersion200:') asString)}.
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