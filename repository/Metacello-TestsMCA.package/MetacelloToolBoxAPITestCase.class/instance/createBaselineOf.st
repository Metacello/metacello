private BaselineOf
createBaselineOf
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
    commitBaselineOfMethod