external core
setUpExternalCoreX: packageRepo extraDefs: extraDefinitionArray packageVersion: packageVersion info: infoArray
  "self reset"

  | basePackageName className definitionArray |
  basePackageName := 'External-CoreX'.
  className := 'ExternalCoreX'.
  definitionArray := {(self
    createClassDefinitionFor: className
    superclassName: #'Object'
    category: basePackageName
    instVarNames: #()
    comment: '').
  (self
    createMethodDefinitionFor: className
    classIsMeta: true
    selector: 'externalAuthorName'
    category: 'cat'
    source: (self sourceCodeAt: #'externalAuthorName')).
  (self
    createMethodDefinitionFor: 'Object'
    classIsMeta: true
    selector: 'isExternal'
    category: '*external-corex'
    source: (self sourceCodeAt: #'isExternal'))}.
  ^ self
    createPackage: basePackageName
    packageVersion: packageVersion
    in: packageRepo
    withDefinitions: definitionArray , extraDefinitionArray
    info: infoArray