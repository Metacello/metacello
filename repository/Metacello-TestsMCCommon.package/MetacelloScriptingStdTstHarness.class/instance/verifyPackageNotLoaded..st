utilities
verifyPackageNotLoaded: packageName
  self
    assert:
      (MetacelloPlatform current workingCopyFor: packageName ifNone: [  ]) isNil