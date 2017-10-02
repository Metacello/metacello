scripting
hasNoLoadConflicts: aMetacelloRepositoriesSpec
  | repositorySpecs anotherRepositorySpecs |
  repositorySpecs := MetacelloPlatform current
    sort: self map values
    with: [ :a :b | a description <= b description ].
  anotherRepositorySpecs := MetacelloPlatform current
    sort: aMetacelloRepositoriesSpec map values
    with: [ :a :b | a description <= b description ].
  repositorySpecs size ~= anotherRepositorySpecs size
    ifTrue: [ ^ false ].
  1 to: repositorySpecs size do: [ :index | 
    | repoSpec anotherRepoSpec |
    repoSpec := repositorySpecs at: index.
    anotherRepoSpec := anotherRepositorySpecs at: index.
    (repoSpec hasNoLoadConflicts: anotherRepoSpec)
      ifFalse: [ ^ false ] ].
  ^ true
