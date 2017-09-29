scripting
compareEqual: aMetacelloProjectSpec
  | repositorySpecs anotherRepositorySpecs |
  repositorySpecs := (MetacelloPlatform current
    sort: self map values
    with: [ :a :b | a description <= b description ])
    collect: [ :each | each description ].
  anotherRepositorySpecs := (MetacelloPlatform current
    sort: aMetacelloProjectSpec map values
    with: [ :a :b | a description <= b description ])
    collect: [ :each | each description ].
  ^ repositorySpecs = anotherRepositorySpecs
