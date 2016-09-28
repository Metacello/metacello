AtomicX
setUpBaselineOfAtomicX: packageRepo packageVersion: packageVersion loadType: loadType
  "self reset"

  | className basePackageName definitionArray |
  className := basePackageName := 'BaselineOfAtomicX'.
  definitionArray := {(self
    createClassDefinitionFor: className
    superclassName: 'BaselineOf'
    category: basePackageName
    instVarNames: #()
    comment: '').
  (self
    createMethodDefinitionFor: className
    classIsMeta: false
    selector: 'atomicBaselineX:'
    category: 'cat'
    source: (self sourceCodeAt: #'atomicBaselineX:')).
  (self
    createMethodDefinitionFor: className
    classIsMeta: false
    selector: 'projectClass'
    category: 'cat'
    source: self sourceCodeForCypressBaselineProjectClass).
  (self loadTypeBaselineMethodDefinition: className loadType: loadType)}.
  ^ self
    createPackage: basePackageName
    packageVersion: packageVersion
    in: packageRepo
    withDefinitions: definitionArray