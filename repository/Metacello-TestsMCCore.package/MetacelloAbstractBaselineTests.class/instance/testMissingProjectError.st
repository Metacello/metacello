tests
testMissingProjectError
  "see MetacelloScriptingErrorsTestCase"

  | repoExternal repoAlternate platform |
  platform := MetacelloPlatform current.
  repoExternal := 'filetree://'
    , (platform fullNameForDirectory: externalDirectory).
  self
    should: [ 
      Metacello new
        className: 'BaselineExternalX';
        repository: repoExternal;
        silently;
        load ]
    raise: Error