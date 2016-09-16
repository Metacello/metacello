external core
setUpExternalCoreX
  "self reset"

  | basePackageName className definitionArray packageVersion |
  basePackageName := className := #'ExternalCoreX'.
  packageVersion := '-dkh.1'.
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
    in: externalRepository
    withDefinitions: definitionArray