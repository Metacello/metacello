RecordX
setUpBaselineOfRecordRefX: packageRepo packageVersion: packageVersion
  "self reset"

  | className basePackageName definitionArray |
  className := basePackageName := 'BaselineOfRecordRefX'.
  definitionArray := {(self
    createClassDefinitionFor: className
    superclassName: 'BaselineOf'
    category: basePackageName
    instVarNames: #()
    comment: '').
  (self
    createMethodDefinitionFor: className
    classIsMeta: false
    selector: 'recordBaselineRefX:'
    category: 'cat'
    source: (self sourceCodeAt: #'recordBaselineRefX:')).
  (self
    createMethodDefinitionFor: className
    classIsMeta: false
    selector: 'projectClass'
    category: 'cat'
    source: self sourceCodeForCypressBaselineProjectClass)}.
  ^ self
    createPackage: basePackageName
    packageVersion: packageVersion
    in: packageRepo
    withDefinitions: definitionArray