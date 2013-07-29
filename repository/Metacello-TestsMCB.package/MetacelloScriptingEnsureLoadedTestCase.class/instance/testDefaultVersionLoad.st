running
testDefaultVersionLoad
  "https://github.com/dalehenrich/metacello-work/issues/198"

  Gofer new
    version: 'ConfigurationOfExternal-dkh.1';
    repository: configurationRepository;
    load.
  Metacello new
    configuration: 'ExternalRef';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    get.
  Metacello new
    configuration: 'ExternalRef';
    version: '0.9.0';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    load	"should load without error"