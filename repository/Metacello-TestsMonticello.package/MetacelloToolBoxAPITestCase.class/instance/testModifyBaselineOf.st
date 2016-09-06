tests BaselineOf
testModifyBaselineOf
  | x |
  self createBaselineOf.
  (MetacelloToolBox baselineNamed: self baselineName asString)
    modifyBaselineOf;
    modifySection: #'common' asMetacelloAttributePath
      repository: nil
      requiredProjects: #()
      packages: #('GoferFoo')
      dependencies: {('GeauxFaux' -> #('GoferFoo'))}
      includes: #()
      files: #()
      repositories: #()
      preLoadDoIts: #()
      postLoadDoIts: #()
      supplyingAnswers: #()
      groups: #()
      versionSpecsDo: [ :versionSpec | true ];
    commitBaselineOfMethod.
  self
    assert:
      (x := (Smalltalk at: self baselineName) sourceCodeAt: #'baseline:')
        = self baselineOfModifiedSourceString