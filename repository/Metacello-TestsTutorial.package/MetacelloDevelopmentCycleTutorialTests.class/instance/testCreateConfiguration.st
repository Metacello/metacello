tests
testCreateConfiguration
  [ 
  | expected output |
  self createConfiguration.
  expected := self versionCommonBaselineSpecString.
  MetacelloPlatform current
    globalNamed: self configurationName
    ifPresent: [ :cl | 
      output := (cl project version: '1.0-baseline') versionSpec printString.
      self assert: output = expected ] ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'testCreateConfiguration Error: ' , ex description.
      ex pass ]