running
setUp
  | repo |
  super setUp.
  MetacelloPlatform current clearPackageCache.
  MetacelloConfigurationResource projectAttributes: nil.
  repo := self monticelloRepository.
  self tempRepositories add: repo.
  gofer repository: repo.
  MetacelloPlatform current
    globalNamed: #'Metacello_Gofer_Test_Repository'
    put: repo.
  repo := self alternateRepository.
  self tempRepositories add: repo.
  MetacelloPlatform current
    globalNamed: #'Metacello_Configuration_Test_Alternate_Repository'
    put: repo.
  repo := self configurationRepository.
  self tempRepositories add: repo.
  MetacelloPlatform current
    globalNamed: #'Metacello_Configuration_Test_Repository'
    put: repo.
  initialWorkingCopyList := MetacelloPlatform current workingCopyNames.
  undefinedSymbols := MetacelloPlatform current disableUndefinedSybolUpdates