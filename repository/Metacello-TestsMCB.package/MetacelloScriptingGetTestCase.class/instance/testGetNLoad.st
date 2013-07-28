tests
testGetNLoad
  Metacello new
    baseline: 'ExternalX';
    repository: 'filetree://' , externalDirectory fullName;
    get.
  Metacello registry
    baseline: 'ExternalX';
    load.
  Transcript
    cr;
    show: 'GetNLoad'.
  self
    validateExpectedConfigurationClassName: nil
    expectedConfigurationVersion: nil
    expectedConfigurationRepository: nil
    expectedBaselineClassName: 'BaselineOfExternalX'
    expectedBaselineVersion: 'baseline'
    expectedBaselineRepository: 'filetree://' , externalDirectory fullName