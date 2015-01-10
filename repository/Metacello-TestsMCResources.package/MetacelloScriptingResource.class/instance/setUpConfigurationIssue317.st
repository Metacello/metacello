issue 317
setUpConfigurationIssue317
  "self reset"

  | reference className definitionArray versionInfo |
  reference := GoferVersionReference name: 'ConfigurationOfIssue317-dkh.1'.
  className := #'ConfigurationOfIssue317'.
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
    selector: 'issue317version100:'
    category: 'cat'
    timeStamp: ''
    source: (self class sourceCodeAt: #'issue317version100:') asString).
  (MCMethodDefinition
    className: className asString
    classIsMeta: false
    selector: 'issue317version200:'
    category: 'cat'
    timeStamp: ''
    source: (self class sourceCodeAt: #'issue317version200:') asString)}.
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