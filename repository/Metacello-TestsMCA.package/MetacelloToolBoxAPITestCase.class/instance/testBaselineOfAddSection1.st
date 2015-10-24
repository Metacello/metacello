tests BaselineOf
testBaselineOfAddSection1
  "Add section as part of creating a new version"

  | toolbox x y |
  self createBaselineOf.
  (toolbox := MetacelloToolBox baselineNamed: self baselineName asString)
    addBaselineOfSection: #'pharo'
      requiredProjects: #()
      packages: #('GoferFoo' 'GoferBar')
      dependencies: {('GoferBar' -> #('GoferFoo'))}
      groups: {('UI' -> #('GoferBar'))}
      versionSpecsDo: [ :versionSpec |  ];
    commitBaselineOfMethod.
  self
    assert:
      (x := (Smalltalk at: self baselineName) sourceCodeAt: #'baseline:')
        = (y := self baselineExhibit1SourceString)