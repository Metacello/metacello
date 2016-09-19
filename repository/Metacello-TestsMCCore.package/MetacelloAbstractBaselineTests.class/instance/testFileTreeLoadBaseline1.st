tests
testFileTreeLoadBaseline1
  | platform metacello |
  platform := MetacelloPlatform current.
  metacello := Metacello new
    baseline: 'ExternalX';
    repository:
        'filetree://' , (platform fullNameForDirectory: externalDirectory);
    silently.
  metacello get.
  self assert: (platform globalNamed: 'BaselineOfExternalX') notNil.
  metacello load.
  self assert: (platform globalNamed: 'ExternalCoreX') notNil.
  self deny: Object isExternal.
  self
    assert: (platform globalNamed: 'ExternalCoreX') externalAuthorName = 'dkh'