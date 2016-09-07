*metacello-testsmonticellob
testFileTreeLoadMarianosImage1
  Metacello new
    project: 'MarianosImage';
    className: 'MarianosImage';
    version: '0.9.0';
    repository: 'filetree://' , configurationDirectory fullName;
    silently;
    load.
  self
    validate: 'MarianosImage'
    expConfigVersion: '0.9.0'
    expConfigRepo: 'filetree://' , configurationDirectory fullName
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil.
  self
    validate: nil
    expConfigVersion: nil
    expConfigRepo: nil
    expBaselineClassName: 'BaselineOfExternalX'
    expBaselineVersion: 'baseline'
    expBaselineRepo:
      'dictionary://Metacello_Configuration_Test_Repository'