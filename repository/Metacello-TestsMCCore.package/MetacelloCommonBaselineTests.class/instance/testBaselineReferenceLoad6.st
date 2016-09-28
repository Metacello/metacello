tests
testBaselineReferenceLoad6
  | repoAlternate platform |
  platform := MetacelloPlatform current.
  repoAlternate := 'filetree://'
    , (platform fullNameForDirectory: alternateDirectory).
  platform
    globalNamed: 'Metacello_ExternalX_ExternalRepository_URL'
    put: repoAlternate.
  Metacello new
    baseline: 'ExternalRefX';
    repository: repoAlternate;
    silently;
    load.
  self
    validateRegistrationForBaseline: 'BaselineOfExternalRefX'
    expectedRepoDescription: repoAlternate.	"original repo"
  self
    validateRegistrationForBaseline: 'BaselineOfExternalX'
    expectedRepoDescription: repoAlternate	"spec repo"