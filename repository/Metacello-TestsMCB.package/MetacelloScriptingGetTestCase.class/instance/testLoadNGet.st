tests
testLoadNGet
  "explicitly load ConfigurationOfExternalX-dkh.1 do load of 0.9.0, then get ... should have ConfigurationOfExternalX-dkh.2"

  [ 
  | projectSpec |
  Transcript
    cr;
    show: 'testLoadNGet [0]'.
  Gofer new
    version: 'ConfigurationOfExternalX-dkh.1';
    repository: configurationRepository;
    load.
  Transcript
    cr;
    show: 'testLoadNGet [1]'.
  Metacello new
    configuration: 'ExternalX';
    version: '0.9.0';
    repository: 'dictionary://Metacello_XXX_Test_Repository';
    load.
  Transcript
    cr;
    show: 'testLoadNGet [2]'.
  self
    verify: 'ConfigurationOfExternalX'
    version: 'ConfigurationOfExternalX-dkh.1'.
  projectSpec := (Metacello registry
    configuration: 'ExternalX';
    list) first.
  self
    assert:
      projectSpec repositoryDescriptions asArray
        = #('dictionary://Metacello_XXX_Test_Repository').
  Metacello new
    configuration: 'ExternalX';
    repository: 'dictionary://Metacello_Config_Test_Repository';
    get.
  Transcript
    cr;
    show: 'testLoadNGet [3]'.
  self
    verify: 'ConfigurationOfExternalX'
    version: 'ConfigurationOfExternalX-dkh.2'.
  projectSpec := (Metacello registry
    configuration: 'ExternalX';
    list) first.
  self
    assert:
      projectSpec repositoryDescriptions asArray
        = #('dictionary://Metacello_Config_Test_Repository').
  Transcript
    cr;
    show: 'testLoadNGet [4]' ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'testLoadNGet [5]: ' , ex description.
      ex pass ]