*metacello-testsmonticellob
testMczLoad1
  Metacello new
    project: 'MetacelloExample';
    className: 'ConfigurationOfMetacelloExample';
    version: '1.0';
    repository: 'dictionary://Metacello_MczConfiguration_Test_Repository';
    load.
  self
    validate: 'ConfigurationOfMetacelloExample'
    expConfigVersion: '1.0'
    expConfigRepo: 'dictionary://Metacello_MczConfiguration_Test_Repository'
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil