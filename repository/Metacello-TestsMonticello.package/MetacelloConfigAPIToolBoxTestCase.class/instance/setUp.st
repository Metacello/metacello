running
setUp
  | repo |
  super setUp.
  MetacelloConfigurationResource projectAttributes: nil.
  repo := self monticelloRepository.
  gofer := Gofer new.
  gofer disablePackageCache.
  gofer repository: repo.
  MetacelloPlatform current
    globalNamed: #'Metacello_Gofer_Test_Repository'
    put: repo.
  repo := self configurationRepository.
  gofer repository: repo.
  MetacelloPlatform current
    globalNamed: #'Metacello_Configuration_Test_Repository'
    put: repo.
  gofer package: 'MetacelloTestConfigurationOfProjectToolBox'.
  gofer metacelloLoad.
  MetacelloPlatform current
    globalNamed: #'Metacello_Configuration_Test_DoIt_Result'
    put: false.
  MetacelloPlatform current
    globalNamed: #'Metacello_Configuration_Test_POST_DoIt_Result'
    put: false.
  undefinedSymbols := MetacelloPlatform current disableUndefinedSybolUpdates