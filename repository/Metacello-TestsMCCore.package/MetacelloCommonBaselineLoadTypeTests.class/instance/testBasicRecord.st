tests
testBasicRecord
  | platform alternateRepo directive expectedPrintString actualPrintString externalRepo pkgVrsn |
  platform := MetacelloPlatform current.
  alternateRepo := 'filetree://'
    , (platform fullNameForDirectory: alternateDirectory).
  externalRepo := 'filetree://'
    , (platform fullNameForDirectory: externalDirectory).
  MetacelloAbstractBaselineResource doitResults: nil.
  platform
    globalNamed: 'Metacello_ExternalX_ExternalRepository_URL'
    put: externalRepo.
  directive := Metacello new
    baseline: 'RecordRefX';
    repository: alternateRepo;
    silently;
    record.
  actualPrintString := directive printString.
  pkgVrsn := self hasPackageVersion
    ifTrue: [ '-dkh.1' ]
    ifFalse: [ '' ].
  expectedPrintString := 'linear load : 
	linear load : baseline [BaselineOfRecordRefX]
		load : BaselineOfAtomicX
	linear load : baseline [BaselineOfRecordRefX]
		explicit load : AtomicX
			load : BaselineOfAtomicX'
    , pkgVrsn
    ,
      '
		' , self projectLoadType asString
    ,
      ' load : baseline [BaselineOfAtomicX]
			load : Atomic-CoreX-One
			load : Atomic-CoreX-Two
			load : Atomic-CoreX-Three'.
  self
    assert:
      actualPrintString withUnixLineEndings = expectedPrintString withUnixLineEndings