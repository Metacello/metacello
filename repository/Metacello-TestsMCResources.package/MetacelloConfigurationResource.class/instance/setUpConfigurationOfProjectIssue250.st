Issue 250
setUpConfigurationOfProjectIssue250
  "self reset"

  | reference className definitionArray versionInfo |
  reference := GoferVersionReference
    name: 'MetacelloTestConfigurationOfProjectIssue250-dkh.1'.
  className := reference packageName asSymbol.
  definitionArray := {(MCOrganizationDefinition
    categories: (Array with: className)).
  (MCClassDefinition
    name: className
    superclassName: #'Object'
    category: className
    instVarNames: #()
    comment: '').
  (MCMethodDefinition
    className: className asString
    classIsMeta: true
    selector: 'project'
    category: 'cat'
    timeStamp: ''
    source: self projectClassMethodSource).
  (MCMethodDefinition
    className: className asString
    selector: 'project'
    category: 'cat'
    timeStamp: ''
    source: self projectMethodSource).
  (MCMethodDefinition
    className: className asString
    selector: 'version20Issue250:'
    category: 'cat'
    timeStamp: ''
    source: (self class sourceCodeAt: #'version20Issue250:') asString).
  (MCMethodDefinition
    className: className asString
    selector: 'baselineVersion20Issue250:'
    category: 'cat'
    timeStamp: ''
    source: (self class sourceCodeAt: #'baselineVersion20Issue250:') asString).
  (MCMethodDefinition
    className: className asString
    selector: 'version21Issue250:'
    category: 'cat'
    timeStamp: ''
    source: (self class sourceCodeAt: #'version21Issue250:') asString).
  (MCMethodDefinition
    className: className asString
    selector: 'baselineVersion21Issue250:'
    category: 'cat'
    timeStamp: ''
    source: (self class sourceCodeAt: #'baselineVersion21Issue250:') asString)}.
  monticelloRepository
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