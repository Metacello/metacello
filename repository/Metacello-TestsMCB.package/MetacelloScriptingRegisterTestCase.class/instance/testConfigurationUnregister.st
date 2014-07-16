tests
testConfigurationUnregister
  | projectSpec |
  Metacello new
    configuration: 'Sample';
    version: '1.0.1';
    register.
  Metacello new
    configuration: 'Sample';
    version: '1.0.1';
    unregister.
  projectSpec := Metacello registry
    configuration: 'Sample';
    list.
  self assert: projectSpec isEmpty