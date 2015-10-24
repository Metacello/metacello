utility BaselineOf
createBaselineOf
  MetacelloToolBox
    createBaselineOf: self baselineName asString
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