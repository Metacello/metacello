tests
testConfigurationRegister
  | projectSpec |
  Metacello new
    configuration: 'Sample';
    version: '1.0.1';
    register.
  projectSpec := Metacello registry
    configuration: 'Sample';
    list.
  self
    assert:
      projectSpec repositoryDescriptions asArray
        = {(MetacelloScriptEngine defaultRepositoryDescription)}.
  self assert: projectSpec versionString = '1.0.1'