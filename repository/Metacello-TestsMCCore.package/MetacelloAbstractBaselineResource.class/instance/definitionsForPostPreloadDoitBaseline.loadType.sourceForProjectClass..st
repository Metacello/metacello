private
definitionsForPostPreloadDoitBaseline: className loadType: loadType sourceForProjectClass: sourceForProjectClass
  "self reset"

  ^ {(self
    createClassDefinitionFor: className
    superclassName: 'BaselineOf'
    category: className
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
    source: sourceForProjectClass).
  (self loadTypeBaselineMethodDefinition: className loadType: loadType)}