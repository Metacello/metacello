NestedX
setUpBaselineOfNestedX: packageRepo packageVersion: packageVersion
  "self reset"

  | className basePackageName definitionArray |
  className := basePackageName := 'BaselineOfNestedX'.
  definitionArray := {(self
    createClassDefinitionFor: className
    superclassName: 'BaselineOf'
    category: basePackageName
    instVarNames: #()
    comment: '').
  (self
    createMethodDefinitionFor: className
    classIsMeta: false
    selector: 'nestedBaselineX:'
    category: 'cat'
    source: (self sourceCodeAt: #'nestedBaselineX:')).
  (self
    createMethodDefinitionFor: className
    classIsMeta: false
    selector: 'customProjectAttributes'
    category: 'cat'
    source: (self sourceCodeAt: #'customProjectAttributes'))}.
  ^ self
    createPackage: basePackageName
    packageVersion: packageVersion
    in: packageRepo
    withDefinitions: definitionArray