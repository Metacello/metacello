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
    validate: nil
    expConfigVersion: nil
    expConfigRepo: nil
    expBaselineClassName: 'BaselineOfExternal'
    expBaselineVersion: 'baseline'
    expBaselineRepo:
      'bitbucket://dalehenrich/external:issue\/234/repository'