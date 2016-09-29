PrePostLoadX
setUpBaselineOfPrePostLoadX: packageRepo packageVersion: packageVersion loadType: loadType
  "self reset"

  | className basePackageName definitionArray |
  className := basePackageName := 'BaselineOfPrePostLoadX'.
  definitionArray := {(self
    createClassDefinitionFor: className
    superclassName: 'BaselineOf'
    category: basePackageName
    instVarNames: #()
    comment: '').
  (self
    createMethodDefinitionFor: className
    classIsMeta: false
    selector: 'prePostLoadBaselineX:'
    category: 'cat'
    source: (self sourceCodeAt: #'prePostLoadBaselineX:')).
  (self
    createMethodDefinitionFor: className
    classIsMeta: false
    selector: 'preLoadDoItBaseline:'
    category: 'cat'
    source: (self sourceCodeAt: #'preLoadDoItBaseline:')).
  (self
    createMethodDefinitionFor: className
    classIsMeta: false
    selector: 'postLoadDoItBaseline:versionSpec:'
    category: 'cat'
    source: (self sourceCodeAt: #'postLoadDoItBaseline:versionSpec:')).
  (self
    createMethodDefinitionFor: className
    classIsMeta: false
    selector: 'preLoadDoItPackage'
    category: 'cat'
    source: (self sourceCodeAt: #'preLoadDoItPackage')).
  (self
    createMethodDefinitionFor: className
    classIsMeta: false
    selector: 'postLoadDoItPackage'
    category: 'cat'
    source: (self sourceCodeAt: #'postLoadDoItPackage')).
  (self
    createMethodDefinitionFor: className
    classIsMeta: false
    selector: 'postLoadDoItPackage:'
    category: 'cat'
    source: (self sourceCodeAt: #'postLoadDoItPackage:')).
  (self
    createMethodDefinitionFor: className
    classIsMeta: false
    selector: 'preLoadDoItPackage:packageSpec:'
    category: 'cat'
    source: (self sourceCodeAt: #'preLoadDoItPackage:packageSpec:')).
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