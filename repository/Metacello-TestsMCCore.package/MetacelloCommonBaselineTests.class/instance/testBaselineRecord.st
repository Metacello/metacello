tests
testBaselineRecord
  | repoAlternate platform directive expectedPrintString x pkgVers |
  platform := MetacelloPlatform current.
  repoAlternate := 'filetree://'
    , (platform fullNameForDirectory: alternateDirectory).
  platform
    globalNamed: 'Metacello_ExternalX_ExternalRepository_URL'
    put: repoAlternate.
  directive := Metacello new
    baseline: 'ExternalRefX';
    repository: repoAlternate;
    silently;
    record.
  pkgVers := self hasPackageVersion
    ifTrue: [ '-dkh.2' ]
    ifFalse: [ '' ].
  expectedPrintString := 'linear load : 
	linear load : baseline [BaselineOfExternalRefX]
		load : BaselineOfExternalX
	linear load : baseline [BaselineOfExternalRefX]
		explicit load : ExternalX'
    , pkgVers
    ,
      '
			load : BaselineOfExternalX
		linear load : baseline [BaselineOfExternalX]
			load : External-CoreX'.
  self
    assert:
      (x := directive printString) withUnixLineEndings
        = expectedPrintString withUnixLineEndings