tests
testValidateAndSave
  | repo allVersionsSize |
  repo := MetacelloPlatform current globalNamed: self repositoryName.
  allVersionsSize := repo allVersionInfos size.
  self
    createConfiguration;
    createDevelopment;
    validateAndSave;
    yourself.
  self
    assert:
      (MetacelloToolBox
        validateConfiguration:
          (MetacelloPlatform current globalNamed: self configurationName))
        isEmpty.
  self assert: repo allVersionInfos size = (allVersionsSize + 1)