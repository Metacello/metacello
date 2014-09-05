running
setUpRepositoryContents
  super setUpRepositoryContents.
  self
    setUpRepositoryContents:
      #('ConfigurationOfConflict-dkh.1' 'ConfigurationOfExternalX-dkh.2' 'MarianosImage-dkh.1')
    sourceRepo: MetacelloScriptingResource current configurationRepository
    targetRepo: (MCFileTreeRepository new directory: configurationDirectory).
  Smalltalk
    at: #'Metacello_Conflict_Test_Repository'
    put: configurationRepository	"#('ConfigurationOfExternalX-dkh.1' 'ConfigurationOfExternalXX-dkh.1' 'ConfigurationOfExternalXXX-dkh.1' 'ConfigurationOfExternalIV-dkh.1' 'MarianosImage-dkh.1')"