baseline pragma - external
setUpBaselineOfExternalX
  "self reset"

  | className basePackageName definitionArray packageVersion |
  className := basePackageName := 'BaselineOfExternalX'.
  packageVersion := '-dkh.1'.
  definitionArray := {(self
    createClassDefinitionFor: className
    superclassName: 'BaselineOf'
    category: basePackageName
    instVarNames: #()
    comment: '').
  (self
    createMethodDefinitionFor: className
    classIsMeta: false
    selector: 'externalBaselineX:'
    category: 'cat'
    source: (self sourceCodeAt: #'externalBaselineX:')).
  (self
    createMethodDefinitionFor: className
    classIsMeta: false
    selector: 'projectClass'
    category: 'cat'
    source: self sourceCodeForBaselineProjectClass)}.
  ^ self
    createPackage: basePackageName
    packageVersion: packageVersion
    in: externalPackages
    withDefinitions: definitionArray