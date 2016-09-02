running
setUp
  | repo gofer |
  super setUp.
  repo := MCDictionaryRepository new.
  repo description: 'dictionary://' , self repositoryName asString.
  self tempRepositories add: repo.
  MetacelloPlatform current globalNamed: self repositoryName put: repo.
  repo := MCDictionaryRepository new.
  repo description: 'dictionary://' , self alternatRepositoryName asString.
  self tempRepositories add: repo.
  MetacelloPlatform current globalNamed: self alternatRepositoryName put: repo.
  MetacelloPlatform current
    globalNamed: self configurationName
    ifPresent: [ :cl | cl removeFromSystem ].
  repo := MetacelloConfigurationResource current monticelloRepository.
  self tempRepositories add: repo.
  MetacelloPlatform current
    globalNamed: #'Metacello_Configuration_Test_Repository'
    put: repo.
  gofer := Gofer new
    repository: repo;
    package: 'MetacelloTestConfigurationOfProjectFee';
    metacelloLoad.
  repo := MetacelloMonticelloResource current monticelloRepository.
  repo description: 'dictionary://Metacello_Gofer_Test_Repository'.
  self tempRepositories add: repo.
  MetacelloPlatform current
    globalNamed: #'Metacello_Gofer_Test_Repository'
    put: repo.
  (MetacelloPlatform current
    globalNamed: #'MetacelloTestConfigurationOfProjectFee') new project
    load: '4.0'.
  authorName := MetacelloPlatform current authorName.
  MetacelloPlatform current authorName: 'TesterBob'