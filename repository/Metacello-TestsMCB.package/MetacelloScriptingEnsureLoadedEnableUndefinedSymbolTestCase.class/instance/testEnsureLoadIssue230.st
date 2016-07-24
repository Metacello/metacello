tests
testEnsureLoadIssue230
  "https://github.com/dalehenrich/metacello-work/issues/230"

  "https://github.com/dalehenrich/metacello-work/issues/199"

  "preload ConfigurationOfExternal-dkh.1 and force ensureLoad 
	ConfigurationOfExternal-dkh.2 which has version 0.9.1"

  | registration spec metacello |
  Gofer new
    version: 'ConfigurationOfExternal-dkh.1';
    repository: externalRepository;
    load.
  (metacello := Metacello new)
    configuration: 'ExternalRef';
    version: '0.9.0';
    repository: 'dictionary://Metacello_Configuration_Test_Repository';
    get;
    load.
  registration := Metacello registrations
    detect: [ :each | each projectName = 'ExternalRef' ].
  spec := registration projectSpec.
  self assert: spec versionString = '0.9.0'.
  metacello
    version: '0.9.1';
    load.
  registration := Metacello registrations
    detect: [ :each | each projectName = 'ExternalRef' ].
  spec := registration projectSpec.
  self assert: spec versionString = '0.9.1'