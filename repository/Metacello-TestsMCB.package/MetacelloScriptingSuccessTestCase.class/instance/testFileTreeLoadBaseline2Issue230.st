tests
testFileTreeLoadBaseline2Issue230
  "https://github.com/dalehenrich/metacello-work/issues/230"

  Metacello new
    baseline: 'ExternalX';
    repository: 'filetree://' , externalDirectory fullName;
    silently;
    get;
    load.
  self
    validate: nil
    expConfigVersion: nil
    expConfigRepo: nil
    expBaselineClassName: 'BaselineOfExternalX'
    expBaselineVersion: 'baseline'
    expBaselineRepo: 'filetree://' , externalDirectory fullName