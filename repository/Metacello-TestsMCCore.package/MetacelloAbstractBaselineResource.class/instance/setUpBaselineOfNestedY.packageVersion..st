NestedX
setUpBaselineOfNestedY: packageRepo packageVersion: packageVersion
  "self reset"

  | className basePackageName definitionArray |
  className := basePackageName := 'BaselineOfNestedY'.
  definitionArray := {(self
    createClassDefinitionFor: className
    superclassName: 'BaselineOf'
    category: basePackageName
    instVarNames: #()
    comment: '').
  (self
    createMethodDefinitionFor: className
    classIsMeta: false
    selector: 'nestedBaselineY:'
    category: 'cat'
    source: (self sourceCodeAt: #'nestedBaselineY:')).
  (self
    createMethodDefinitionFor: className
    classIsMeta: false
    selector: 'projectPlatformAttributesWith:'
    category: 'cat'
    source: (self sourceCodeAt: #'projectPlatformAttributesWith:'))}.
  ^ self
    createPackage: basePackageName
    packageVersion: packageVersion
    in: packageRepo
    withDefinitions: definitionArray