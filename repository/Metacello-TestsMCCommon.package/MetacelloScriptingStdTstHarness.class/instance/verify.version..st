utilities
verify: packageName version: fileName
  | externalCoreWorkingCopy x |
  externalCoreWorkingCopy := MetacelloPlatform current
    workingCopyFor: packageName
    ifNone: [ self error: 'Package ' , packageName printString , ' not found' ].
  self assert: (x := externalCoreWorkingCopy ancestors first name) = fileName