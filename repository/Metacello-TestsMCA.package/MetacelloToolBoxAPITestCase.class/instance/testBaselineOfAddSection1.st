tests BaselineOf
testBaselineOfAddSection1
  "Add section as part of creating a new version"

  | x y |
  (MetacelloToolBox baselineNamed: self baselineName asString)
    createBaselineOfMethod: 'baseline:' inCategory: 'baseline';
    addBaselineOfSection: #'common'
      requiredProjects: #('MetacelloTestConfigurationOfFoo')
      packages: #('GeauxFaux' 'GeauxBeau')
      repositories:
        {('MetacelloTestConfigurationOfFoo'
          -> {('dictionary://' , self repositoryName asString)})}
      dependencies:
        {('GeauxFaux' -> #('MetacelloTestConfigurationOfFoo')).
        ('GeauxBeau' -> #('GeauxFaux'))}
      groups:
        {('default' -> #('Core')).
        ('Core' -> #('GeauxFaux')).
        ('Tests' -> #('GeauxBeau')).
        ('Core Tests' -> #('Core' 'Tests'))}
      versionSpecsDo: [ :versionSpec |  ];
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
        = (y := self baselineOfAddSection1SourceString)