ExternalRefX
setUpBaselineOfExternalRefX: packageRepo packageVersion: packageVersion
  "self reset"

  | className basePackageName definitionArray |
  className := basePackageName := 'BaselineOfExternalRefX'.
  definitionArray := {(self
    createClassDefinitionFor: className
    superclassName: 'BaselineOf'
    category: basePackageName
    instVarNames: #()
    comment: '').
  (self
    createMethodDefinitionFor: className
    classIsMeta: false
    selector: 'externalBaselineRefX:'
    category: 'cat'
    source: (self sourceCodeAt: #'externalBaselineRefX:')).
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