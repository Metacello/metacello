tests
testFileTreeLoadBaseline2
  | platform metacello repo |
  repo := 'filetree://' , (platform fullNameForDirectory: externalDirectory).
  platform := MetacelloPlatform current.
  metacello := Metacello new
    baseline: 'ExternalX';
    repository: repo;
    silently.
  metacello get.
  self assert: (platform globalNamed: 'BaselineOfExternalX') notNil.
  metacello load.
  self assert: (platform globalNamed: 'ExternalCoreX') notNil.
  self deny: Object isExternal.
  self
    assert: (platform globalNamed: 'ExternalCoreX') externalAuthorName = 'dkh'.
  MetacelloProjectRegistration registry baselineRegistry
    at: 'BaselineOfExternalX'
    ifPresent: [ :existing | 
      | spec |
      spec := existing baselineProjectSpec.
      self assert: spec versionString = 'baseline'.
      self assert: (spec repositoryDescriptions includes: repo) ]
    ifAbsent: [ 
      "missing registration"
      self assert: false ]