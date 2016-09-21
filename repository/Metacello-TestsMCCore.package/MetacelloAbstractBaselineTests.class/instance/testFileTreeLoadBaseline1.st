tests
testFileTreeLoadBaseline1
  | platform metacello repo |
  platform := MetacelloPlatform current.
  repo := 'filetree://' , (platform fullNameForDirectory: externalDirectory).
  metacello := Metacello new
    baseline: 'ExternalX';
    repository: repo;
    silently;
    load.
  self assert: (platform globalNamed: 'ExternalCoreX') notNil.
  self deny: Object isExternal.
  self
    assert: (platform globalNamed: 'ExternalCoreX') externalAuthorName = 'dkh'.
  self
    validateRegistrationForBaseline: 'BaselineOfExternalX'
    expectedRepoDescription: repo