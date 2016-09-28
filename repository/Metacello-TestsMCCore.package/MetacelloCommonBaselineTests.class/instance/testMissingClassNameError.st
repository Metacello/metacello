tests
testMissingClassNameError
  "see MetacelloScriptingErrorsTestCase"

  | repoExternal repoAlternate platform |
  platform := MetacelloPlatform current.
  repoExternal := 'filetree://'
    , (platform fullNameForDirectory: externalDirectory).
  self
    handleExpectedValidationFailure: [ 
      "when project: is used, className: is required to disabiguate between BaselineOf and ConfigurationOf"
      Metacello new
        project: 'ExternalX';
        repository: repoExternal;
        silently;
        load ]