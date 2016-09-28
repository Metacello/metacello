tests
testBasicAtomicLoad
  | platform repo |
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
  Metacello new
    baseline: 'AtomicX';
    repository: repo;
    onConflictUseIncoming;
    onWarningLog;
    silently;
    load.
  self
    assert: (platform globalNamed: 'AtomicCoreX1') atomicVersionInfo = 'dkh-2';
    assert: (platform globalNamed: 'AtomicCoreX2') atomicVersionInfo = 'dkh-2';
    assert:
        (platform globalNamed: 'AtomicCoreX1') atomicSharedMethod = #'AtomicCoreX1'