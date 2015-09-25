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
    validate: nil
    expConfigVersion: nil
    expConfigRepo: nil
    expBaselineClassName: 'BaselineOfExternal'
    expBaselineVersion: 'baseline'
    expBaselineRepo: 'bitbucket://dalehenrich/external:master/repository'