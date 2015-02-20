tests
testIssue331D
  "https://github.com/dalehenrich/metacello-work/issues/331"

  "Load ExternalRef and verify that registration of External project is a baseline ..."

  Gofer new
    version: 'ConfigurationOfExternal-dkh.1';
    version: 'ConfigurationOfExternalRef-dkh.1';
    repository: externalRepository;
    load.
  Metacello new
    configuration: 'ExternalRef';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    get.
  self
    should: [ 
      "Referencing a non-existent version in ConfigurationOfExternal"
      Metacello new
        configuration: 'ExternalRef';
        version: '0.9.2';
        repository: 'dictionary://Metacello_Configuration_Test_Repository';
        load ]
    raise: MetacelloProjectSpecLoadError