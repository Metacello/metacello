tests
testBasicCypressRecord
  | platform repo directive files |
  platform := MetacelloPlatform current.
  repo := 'filetree://' , (platform fullNameForDirectory: externalDirectory).
  MetacelloAbstractBaselineResource doitResults: nil.
  directive := Metacello new
    baseline: 'CypressRecordX';
    repository: repo;
    silently;
    record.
  self assert: MetacelloAbstractBaselineResource doitResults isEmpty.
  files := #('Atomic-CoreX-One' 'Atomic-CoreX-Two') asOrderedCollection.
  directive
    packageDirectivesDo: [ :pkgDirective | files remove: pkgDirective packageName ifAbsent: [ self assert: false ] ]