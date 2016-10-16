tests
testNestedLoadX01
  | platform repo |
  platform := MetacelloPlatform current.
  repo := 'filetree://' , (platform fullNameForDirectory: externalDirectory).
  MetacelloAbstractBaselineResource customProjectAttributes: #().
  Metacello new
    baseline: 'NestedX';
    repository: repo;
    silently;
    load.
  self
    assert: (platform globalNamed: 'AtomicCoreX1') isNil;
    assert: (platform globalNamed: 'AtomicCoreX2') isNil;
    assert: (platform globalNamed: 'AtomicCoreX3') isNil;
    yourself