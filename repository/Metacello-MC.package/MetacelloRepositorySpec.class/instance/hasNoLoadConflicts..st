mc support
hasNoLoadConflicts: aMetacelloRepositorySpec
  self description = aMetacelloRepositorySpec description
    ifTrue: [ ^ true ].
  self type = 'github'
    ifTrue: [ 
      ^ self createRepository
        hasNoLoadConflicts: aMetacelloRepositorySpec createRepository ].
  ^ false