AtomicX
setUpAtomicCoreX3: packageRepo extraDefs: extraDefinitionArray packageVersion: packageVersion info: infoArray
  "self reset"

  | basePackageName className definitionArray |
  basePackageName := 'Atomic-CoreX-Three'.
  className := 'AtomicCoreX3'.
  definitionArray := {(self
    createClassDefinitionFor: className
    superclassName: #'Object'
    category: basePackageName
    instVarNames: #()
    comment: '')}.
  ^ self
    createPackage: basePackageName
    packageVersion: packageVersion
    in: packageRepo
    withDefinitions: definitionArray , extraDefinitionArray
    info: infoArray