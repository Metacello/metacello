tests
testPrePostLoadDoits
  | platform repo doits expectedDoitsSelectors |
  platform := MetacelloPlatform current.
  repo := 'filetree://' , (platform fullNameForDirectory: externalDirectory).
  MetacelloAbstractBaselineResource doitResults: nil.
  Metacello new
    baseline: 'PrePostLoadX';
    repository: repo;
    silently;
    load.
  doits := MetacelloAbstractBaselineResource doitResults.
  self assert: doits size = 6.
  expectedDoitsSelectors := self projectLoadType == #'linear'
    ifTrue: [ 
      {#'preLoadDoItBaseline:'.
      #'preLoadDoItPackage'.
      #'postLoadDoItPackage:'.
      #'preLoadDoItPackage:packageSpec:'.
      #'postLoadDoItPackage'.
      #'postLoadDoItBaseline:versionSpec:'} ]
    ifFalse: [ 
      {#'preLoadDoItBaseline:'.
      #'preLoadDoItPackage'.
      #'preLoadDoItPackage:packageSpec:'.
      #'postLoadDoItPackage:'.
      #'postLoadDoItPackage'.
      #'postLoadDoItBaseline:versionSpec:'} ].
  self assert: expectedDoitsSelectors = (doits collect: [ :ar | ar at: 1 ]).
  doits
    do: [ :ar | 
      "a loader class"
      ar size > 2
        ifTrue: [ self assert: (ar at: 2) isBehavior ] ].
  self projectLoadType == #'linear'
    ifTrue: [ 
      self assert: (doits at: 4) size = 3.
      self assert: (((doits at: 4) at: 3) isKindOf: MetacelloPackageSpec).
      self assert: ((doits at: 4) at: 3) name = 'Atomic-CoreX-Two' ]
    ifFalse: [ 
      self assert: (doits at: 3) size = 3.
      self assert: (((doits at: 3) at: 3) isKindOf: MetacelloPackageSpec).
      self assert: ((doits at: 3) at: 3) name = 'Atomic-CoreX-Two' ].
  self assert: (doits at: 6) size = 3.
  self assert: (((doits at: 6) at: 3) isKindOf: MetacelloVersionSpec).
  self assert: ((doits at: 6) at: 3) versionString = 'baseline'