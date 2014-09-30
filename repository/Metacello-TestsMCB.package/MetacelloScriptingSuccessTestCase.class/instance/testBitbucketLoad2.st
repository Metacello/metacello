tests
testBitbucketLoad2
  Metacello new
    baseline: 'External';
    repository:
        'bitbucket://dalehenrich/external:'
            , MetacelloScriptingResource externalCustomSHA , '/repository';
    load.
  self
    verify: 'External-Core'
    loadedFrom:
      'bitbucket://dalehenrich/external:'
        , MetacelloScriptingResource externalCustomSHA , '/repository'.
  self
    validateExpectedConfigurationClassName: nil
    expectedConfigurationVersion: nil
    expectedConfigurationRepository: nil
    expectedBaselineClassName: 'BaselineOfExternal'
    expectedBaselineVersion: 'baseline'
    expectedBaselineRepository:
      'bitbucket://dalehenrich/external:'
        , MetacelloScriptingResource externalCustomSHA , '/repository'