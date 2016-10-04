BranchX
setUpBranchCoreX: branch packageRepo: packageRepo packageVersion: packageVersion
  "self reset"

  | basePackageName packageName className definitionArray |
  basePackageName := 'Branch-CoreX'.
  packageName := basePackageName , '.' , branch.
  className := 'BranchCoreX'.
  definitionArray := {(self
    createClassDefinitionFor: className
    superclassName: #'Object'
    category: basePackageName
    instVarNames: #()
    comment: '').
  (self
    createMethodDefinitionFor: className
    classIsMeta: true
    selector: 'installedBranch'
    category: 'cat'
    source: 'installedBranch ^''' , branch , '''')}.
  ^ self
    createPackage: packageName
    packageVersion: packageVersion
    in: packageRepo
    withDefinitions: definitionArray
    info: #()