tests
testBasicLoad
  | platform repo expectMNU gotMNU |
  platform := MetacelloPlatform current.
  repo := 'filetree://' , (platform fullNameForDirectory: externalDirectory).
  Metacello new
    baseline: 'AtomicX';
    repository: repo;
    silently;
    load.
  self
    assert: (platform globalNamed: 'AtomicCoreX1') notNil;
    assert: (platform globalNamed: 'AtomicCoreX1') atomicVersionInfo = 'dkh-1';
    assert: (platform globalNamed: 'AtomicCoreX2') notNil;
    assert: (platform globalNamed: 'AtomicCoreX2') atomicVersionInfo = 'dkh-1';
    assert:
        (platform globalNamed: 'AtomicCoreX1') atomicSharedMethod = #'AtomicCoreX1'.
  repo := 'filetree://' , (platform fullNameForDirectory: alternateDirectory).
  expectMNU := self projectLoadType == #'linear'.
  gotMNU := false.
  [ 
  Metacello new
    baseline: 'AtomicX';
    repository: repo;
    onConflictUseIncoming;
    onWarningLog;
    silently;
    load ]
    on: MessageNotUnderstood
    do: [ :ex | 
      self halt.
      ex selector == #'atomicSharedMethod'
        ifTrue: [ gotMNU := true ]
        ifFalse: [ ex pass ] ].
  self assert: expectMNU == gotMNU.
  expectMNU
    ifTrue: [ 
      "AtomicCoreX2 not loaded, since MNU occurs after AtomicCoreX1-dkh.2 loaded, but before AtomicCoreX2-dkh.2 loaded"
      self
        assert:
            (platform globalNamed: 'AtomicCoreX1') atomicVersionInfo = 'dkh-2';
        assert:
            (platform globalNamed: 'AtomicCoreX2') atomicVersionInfo = 'dkh-1'.
      self
        should: [ (platform globalNamed: 'AtomicCoreX1') atomicSharedMethod = #'AtomicCoreX1' ]
        raise: MessageNotUnderstood ]
    ifFalse: [ 
      self
        assert:
            (platform globalNamed: 'AtomicCoreX1') atomicVersionInfo = 'dkh-2';
        assert:
            (platform globalNamed: 'AtomicCoreX2') atomicVersionInfo = 'dkh-2';
        assert:
            (platform globalNamed: 'AtomicCoreX1') atomicSharedMethod = #'AtomicCoreX1' ]