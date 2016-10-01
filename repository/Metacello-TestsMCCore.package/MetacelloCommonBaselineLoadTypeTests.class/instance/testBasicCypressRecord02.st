tests
testBasicCypressRecord02
  | platform repo directive files expectedPrintString x |
  platform := MetacelloPlatform current.
  repo := 'filetree://' , (platform fullNameForDirectory: externalDirectory).
  MetacelloAbstractBaselineResource doitResults: nil.
  directive := Metacello new
    baseline: 'CypressRecordX';
    repository: repo;
    silently;
    record.
  expectedPrintString := 'linear load : 
	linear load : baseline [BaselineOfCypressRecordX]
		load : Atomic-CoreX-One
		load : Atomic-CoreX-Two'.
  self
    assert:
      (x := directive printString) withUnixLineEndings
        = expectedPrintString withUnixLineEndings