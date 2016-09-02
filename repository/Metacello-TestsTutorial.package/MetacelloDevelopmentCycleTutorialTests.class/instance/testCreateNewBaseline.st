tests
testCreateNewBaseline
  | expected output |
  self
    createConfiguration;
    createDevelopment;
    validateAndSave;
    releaseDevelopment;
    createNewDevelopment;
    createNewBaseline;
    yourself.
  expected := self versionCommonBaselineSpecString.
  MetacelloPlatform current
    globalNamed: self configurationName
    ifPresent: [ :cl | 
      output := (cl project version: '1.1-baseline') versionSpec printString.
      self assert: output = expected ]