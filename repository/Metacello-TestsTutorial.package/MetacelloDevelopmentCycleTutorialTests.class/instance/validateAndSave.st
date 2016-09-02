lessons
validateAndSave
  | wc |
  MetacelloToolBox
    validateConfiguration:
      (MetacelloPlatform current globalNamed: self configurationName).
  MetacelloPlatform current
    registerPackageNamed: self configurationName asString.	"register workingCopy for gofer to use"
  wc := MCWorkingCopy
    forPackage:
      (MetacelloTestsMCPackage new name: self configurationName asString).
  (wc repositoryGroup respondsTo: #'disableCache')
    ifTrue: [ wc repositoryGroup perform: #'disableCache' ].
  Gofer new
    disablePackageCache;
    repository: (MetacelloPlatform current globalNamed: self repositoryName);
    package: self configurationName asString;
    commit: 'Initial configuration'.	"fix it so that the directory repository is used for subsequent saves"
  wc := (MetacelloPlatform current globalNamed: self configurationName) project
    projectPackage workingCopy.
  wc repositoryGroup
    addRepository: (MetacelloPlatform current globalNamed: self repositoryName).
  MetacelloToolBox
    saveConfigurationPackageFor: self configurationName asString
    description: 'commit message'