utilities
hasPackage: aPackageName
  ^ (MetacelloPlatform current workingCopyFor: aPackageName ifNone: [  ]) notNil