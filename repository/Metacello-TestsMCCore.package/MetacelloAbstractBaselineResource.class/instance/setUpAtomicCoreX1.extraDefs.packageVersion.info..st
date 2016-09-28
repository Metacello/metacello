AtomicX
setUpAtomicCoreX1: packageRepo extraDefs: extraDefinitionArray packageVersion: packageVersion info: infoArray
  "self reset"

  | basePackageName className definitionArray |
  basePackageName := 'Atomic-CoreX-1'.
  className := 'AtomicCoreX1'.
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