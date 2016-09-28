tests
testBaselineConflict6WithLock6
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
    lock.
  Metacello new
    baseline: 'ExternalRefX';
    repository: repoAlternate;
    onLock: [ :ex | ex allow	"underlying implementation of break" ];
    silently;
    load.
  self
    validateRegistrationForBaseline: 'BaselineOfExternalRefX'
    expectedRepoDescription: repoAlternate.	"original repo"
  self
    validateRegistrationForBaseline: 'BaselineOfExternalX'
    expectedRepoDescription: repoAlternate	"original repo - broken lock"