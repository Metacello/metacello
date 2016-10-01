tests
testBasicCypressRecord02
  | platform repo directive files expectedPrintString x loadType |
  platform := MetacelloPlatform current.
  repo := 'filetree://' , (platform fullNameForDirectory: externalDirectory).
  MetacelloAbstractBaselineResource doitResults: nil.
  directive := Metacello new
    baseline: 'CypressRecordX';
    repository: repo;
    silently;
    record.
  loadType := self projectLoadType asString.
  expectedPrintString := 'linear load : 
	' , loadType
    ,
      ' load : baseline [BaselineOfCypressRecordX]
		load : Atomic-CoreX-One
		load : Atomic-CoreX-Two'.
  self
    assert:
      (x := directive printString) withUnixLineEndings
        = expectedPrintString withUnixLineEndings