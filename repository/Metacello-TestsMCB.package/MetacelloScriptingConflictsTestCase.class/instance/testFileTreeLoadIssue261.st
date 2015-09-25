issue 261
testFileTreeLoadIssue261
  Metacello new
    project: 'MarianosImage';
    className: 'MarianosImage';
    version: '0.9.0';
    repository: 'filetree://' , configurationDirectory fullName;
    silently;
    load.
  self
    validateExpConfigClassName: 'MarianosImage'
    expConfigVersion: '0.9.0'
    expConfigRepo: 'filetree://' , configurationDirectory fullName
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil.
  self
    validateExpConfigClassName: nil
    expConfigVersion: nil
    expConfigRepo: nil
    expBaselineClassName: 'BaselineOfExternalX'
    expBaselineVersion: 'baseline'
    expBaselineRepo: 'dictionary://Metacello_Configuration_Test_Repository'