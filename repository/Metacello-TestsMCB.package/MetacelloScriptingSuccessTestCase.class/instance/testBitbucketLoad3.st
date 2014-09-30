tests
testBitbucketLoad3
  Metacello new
    baseline: 'External';
    repository: 'bitbucket://dalehenrich/external:issue\/234/repository';
    load.
  self
    verify: 'External-Core'
    loadedFrom: 'bitbucket://dalehenrich/external:issue\/234/repository'.
  self
    validateExpectedConfigurationClassName: nil
    expectedConfigurationVersion: nil
    expectedConfigurationRepository: nil
    expectedBaselineClassName: 'BaselineOfExternal'
    expectedBaselineVersion: 'baseline'
    expectedBaselineRepository:
      'bitbucket://dalehenrich/external:issue\/234/repository'