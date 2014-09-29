tests
testBitbucketLoad1
  Metacello new
    baseline: 'External';
    repository: 'bitbucket://dalehenrich/external:master/repository';
    load.
  self
    verify: 'External-Core'
    loadedFrom: 'bitbucket://dalehenrich/external:master/repository'.
  self
    validateExpectedConfigurationClassName: nil
    expectedConfigurationVersion: nil
    expectedConfigurationRepository: nil
    expectedBaselineClassName: 'BaselineOfExternal'
    expectedBaselineVersion: 'baseline'
    expectedBaselineRepository:
      'bitbucket://dalehenrich/external:master/repository'