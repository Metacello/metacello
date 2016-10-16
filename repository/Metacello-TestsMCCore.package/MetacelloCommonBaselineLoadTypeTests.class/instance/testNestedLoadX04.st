tests
testNestedLoadX04
  | platform repo directive expectedPrintString x |
  platform := MetacelloPlatform current.
  repo := 'filetree://' , (platform fullNameForDirectory: externalDirectory).
  MetacelloAbstractBaselineResource customProjectAttributes: #(#'native').
  Metacello new
    baseline: 'NestedX';
    repository: repo;
    silently;
    load.
  self
    assert: (platform globalNamed: 'AtomicCoreX1') notNil;
    assert: (platform globalNamed: 'AtomicCoreX2') isNil;
    assert: (platform globalNamed: 'AtomicCoreX3') isNil;
    yourself.
  MetacelloAbstractBaselineResource customProjectAttributes: #(#'extension').
  directive := Metacello new
    baseline: 'NestedX';
    repository: repo;
    record.
  expectedPrintString := 'linear load : 
	linear load : baseline [BaselineOfNestedX]
		load : Atomic-CoreX-Three'.
  self assert: (x := directive printString) withUnixLineEndings
        = expectedPrintString withUnixLineEndings.
  Metacello new
    baseline: 'NestedX';
    repository: repo;
    silently;
    load.
  self
    assert: (platform globalNamed: 'AtomicCoreX1') notNil;
    assert: (platform globalNamed: 'AtomicCoreX2') isNil;
    assert: (platform globalNamed: 'AtomicCoreX3') notNil;
    yourself