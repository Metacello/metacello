utilities
verify: packageName loadedFrom: repositoryDescription
  | externalCoreWorkingCopy |
  externalCoreWorkingCopy := MetacelloPlatform current
    workingCopyFor: packageName
    ifNone: [ self error: 'Package ' , packageName printString , ' not found' ].
  self
    assert:
      (externalCoreWorkingCopy repositoryGroup repositories
        includes:
          (MetacelloMCProject new repositorySpec description: repositoryDescription)
            createRepository)