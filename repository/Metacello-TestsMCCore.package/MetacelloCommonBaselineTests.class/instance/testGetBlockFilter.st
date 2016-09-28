tests
testGetBlockFilter
  "see MetacelloScriptingErrorsTestCase"

  | repoExternal platform expected result |
  platform := MetacelloPlatform current.
  repoExternal := 'filetree://'
    , (platform fullNameForDirectory: externalDirectory).
  expected := #('BaselineOfExternalX' 'BaselineOfExternalRefX').
  result := Metacello new
    baseline: [ :projectSpec | true ];
    repository: repoExternal;
    silently;
    get.
  result
    do: [ :project | 
      | baselineName |
      baselineName := project configuration class name asString.
      self assert: (expected includes: baselineName).
      self
        validateRegistrationForBaseline: baselineName
        expectedRepoDescription: repoExternal ]