tests
testGetBlockFilter
  "original test in MetacelloScriptingProjectFilterTestCase"

  | repoExternal platform expected result |
  platform := MetacelloPlatform current.
  repoExternal := 'filetree://'
    , (platform fullNameForDirectory: externalDirectory).
  expected := #(#('BaselineOfExternalX' 'BaselineOfExternalRefX')).
  result := Metacello new
    baseline: [ :projectSpec | true ];
    repository: repoExternal;
    silently;
    get.
  result
    do: [ :project | 
      | baselineName |
      baselineName := project configuration class name.
      self assert: (expected includes: baselineName).
      self
        validateRegistrationForBaseline: baselineName
        expectedRepoDescription: repoExternal ]