tests
testBitbucketLoad4
  Metacello new
    baseline: 'External';
    repository: 'bitbucket://dalehenrich/external:issue\/xxx\/branch/repository';
    load.
  self
    verify: 'External-Core'
    loadedFrom: 'bitbucket://dalehenrich/external:issue\/xxx\/branch/repository'.
  self
    validateExpectedConfigurationClassName: nil
    expectedConfigurationVersion: nil
    expectedConfigurationRepository: nil
    expectedBaselineClassName: 'BaselineOfExternal'
    expectedBaselineVersion: 'baseline'
    expectedBaselineRepository:
      'bitbucket://dalehenrich/external:issue\/xxx\/branch/repository'