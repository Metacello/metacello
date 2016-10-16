tests
testNestedLoad03
  | platform repo |
  platform := MetacelloPlatform current.
  repo := 'filetree://' , (platform fullNameForDirectory: externalDirectory).
  MetacelloAbstractBaselineResource customProjectAttributes: #(#'native' #'two').
  Metacello new
    baseline: 'NestedX';
    repository: repo;
    silently;
    load.
  self
    assert: (platform globalNamed: 'AtomicCoreX1') notNil;
    assert: (platform globalNamed: 'AtomicCoreX2') notNil;
    assert: (platform globalNamed: 'AtomicCoreX3') isNil;
    yourself