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
    validate: nil
    expConfigVersion: nil
    expConfigRepo: nil
    expBaselineClassName: 'BaselineOfExternal'
    expBaselineVersion: 'baseline'
    expBaselineRepo:
      'bitbucket://dalehenrich/external:'
        , MetacelloScriptingResource externalCustomSHA , '/repository'