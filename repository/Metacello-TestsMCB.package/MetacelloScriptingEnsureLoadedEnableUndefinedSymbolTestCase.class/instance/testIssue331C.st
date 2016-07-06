tests
testIssue331C
  "https://github.com/dalehenrich/metacello-work/issues/331"

  "Load ExternalRef and verify that registration of External project is a baseline ..."

  | registration spec |
  Gofer new
    version: 'ConfigurationOfExternal-dkh.1';
    version: 'ConfigurationOfExternalRef-dkh.1';
    repository: externalRepository;
    load.
  Metacello new
    configuration: 'ExternalRef';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    get.
  Metacello new
    configuration: 'ExternalRef';
    version: '0.9.1';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    load.	"should force ConfigurationOfExternal-dkh.2 to be loaded"
  registration := Metacello registrations
    detect: [ :each | each projectName = 'External' ].
  spec := registration projectSpec.
  self assert: spec versionString = '0.9.1'.
  self
    assert:
      spec project configuration class = (Smalltalk at: #'ConfigurationOfExternal')	"diagnostic for this bug"