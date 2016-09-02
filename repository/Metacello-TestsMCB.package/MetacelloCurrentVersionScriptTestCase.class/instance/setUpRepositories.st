running
setUpRepositories
  super setUpRepositories.
  monticelloRepository := MetacelloMonticelloResource current
    monticelloRepository.
  Metacello current
    globalNamed: #'Metacello_Gofer_Test_Repository'
    put: monticelloRepository.
  configurationRepository := MetacelloConfigurationResource current
    monticelloRepository.
  Metacello current
    globalNamed: #'Metacello_Configuration_Test_Repository'
    put: configurationRepository