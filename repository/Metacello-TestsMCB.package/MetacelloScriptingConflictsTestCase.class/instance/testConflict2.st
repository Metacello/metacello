tests
testConflict2
  Metacello new
    configuration: 'Conflict';
    version: '2.0.0';
    repository: 'filetree://' , configurationDirectory fullName;
    silently;
    load.
  Metacello new
    configuration: 'Conflict';
    version: '2.1.0';
    repository: 'filetree://' , configurationDirectory fullName;
    silently;
    onConflict: [ :ex | ex useIncoming ];
    load.
  self
    validate: 'ConfigurationOfConflict'
    expConfigVersion: '2.1.0'
    expConfigRepo: 'filetree://' , configurationDirectory fullName
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil.
  self
    validate: 'ConfigurationOfExternalX'
    expConfigVersion: '0.9.1'
    expConfigRepo: 'dictionary://Metacello_Conflict_Test_Repository'
    expBaselineClassName: nil
    expBaselineVersion: nil
    expBaselineRepo: nil