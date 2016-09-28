tests
testBaselineConflict6WithLock2
  "see MetacelloScriptingConflictsTestCase"

  | repoExternal repoAlternate platform sawLockWarning |
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
    onWarning: [ :ex | 
          sawLockWarning := true.
          ex resume ];
    silently;
    load.
  self assert: sawLockWarning.
  self
    validateRegistrationForBaseline: 'BaselineOfExternalRefX'
    expectedRepoDescription: repoAlternate.	"original repo"
  self
    validateRegistrationForBaseline: 'BaselineOfExternalX'
    expectedRepoDescription: repoExternal	"locked repo"