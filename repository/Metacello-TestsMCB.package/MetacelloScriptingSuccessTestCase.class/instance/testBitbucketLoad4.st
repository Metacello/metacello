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
    validate: nil
    expConfigVersion: nil
    expConfigRepo: nil
    expBaselineClassName: 'BaselineOfExternal'
    expBaselineVersion: 'baseline'
    expBaselineRepo:
      'bitbucket://dalehenrich/external:issue\/xxx\/branch/repository'