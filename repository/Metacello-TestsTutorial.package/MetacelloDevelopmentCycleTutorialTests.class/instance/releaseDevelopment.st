lessons
releaseDevelopment
  MetacelloToolBox
    releaseDevelopmentVersionIn:
      (MetacelloPlatform current globalNamed: self configurationName)
    description: '- release version 1.0'.
  MetacelloToolBox
    copyConfiguration:
      (MetacelloPlatform current globalNamed: self configurationName)
    to: 'dictionary://' , self alternatRepositoryName asString