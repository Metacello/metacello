tests
testBaselineConflict2B
  "see MetacelloScriptingConflictsTestCase"

  | repoExternal repoAlternate platform |
  platform := MetacelloPlatform current.
  repoExternal := 'filetree://'
    , (platform fullNameForDirectory: externalDirectory).
  repoAlternate := 'filetree://'
    , (platform fullNameForDirectory: alternateDirectory).
  platform
    globalNamed: 'Metacello_ExternalX_ExternalRepository_URL'
    put: repoAlternate.
  Metacello new
    baseline: 'ExternalX';
    repository: repoExternal;
    load.
  Metacello new
    baseline: 'ExternalRefX';
    repository: repoAlternate;
    onConflictUseIncoming: #('ExternalX') useLoaded: #();
    silently;
    load.
  self
    validateRegistrationForBaseline: 'BaselineOfExternalRefX'
    expectedRepoDescription: repoAlternate.	"original repo"
  self
    validateRegistrationForBaseline: 'BaselineOfExternalX'
    expectedRepoDescription: repoAlternate	"incoming repo"