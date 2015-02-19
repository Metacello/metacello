tests
testIssue331
  "https://github.com/dalehenrich/metacello-work/issues/331"

  "Load ExternalRef and verify that registration of External project is a baseline ..."

  | registration spec |
  Metacello new
    configuration: 'ExternalRef';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    get.
  Metacello new
    configuration: 'ExternalRef';
    version: '0.9.0';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    load.
  registration := Metacello registrations
    detect: [ :each | each projectName = 'External' ].
  spec := registration projectSpec.
  self assert: spec versionString = '0.9.0'.
  self
    assert:
      spec project configuration class = (Smalltalk at: #'ConfigurationOfExternal')	"diagnostic for this bug"