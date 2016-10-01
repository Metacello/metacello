tests
testBasicMCRecord02
  | platform repo directive files expectedPrintString x |
  platform := MetacelloPlatform current.
  repo := 'filetree://' , (platform fullNameForDirectory: externalDirectory).
  MetacelloAbstractBaselineResource doitResults: nil.
  directive := Metacello new
    baseline: 'MCRecordX';
    repository: repo;
    silently;
    record.
  expectedPrintString := 'linear load : 
	linear load : baseline [BaselineOfMCRecordX]
		load : Atomic-CoreX-One
		load : Atomic-CoreX-Two'.
  self
    assert:
      (x := directive printString) withUnixLineEndings
        = expectedPrintString withUnixLineEndings