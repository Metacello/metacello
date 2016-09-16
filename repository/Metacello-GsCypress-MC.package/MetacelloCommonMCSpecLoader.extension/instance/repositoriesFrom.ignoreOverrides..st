*Metacello-GsCypress-MC
repositoriesFrom: aMetacelloMVRepositorySpecs ignoreOverrides: ignoreOverrides

  (ignoreOverrides not and: [self hasRepositoryOverrides]) ifTrue: [ ^self loaderPolicy overrideRepositories ].
  ^ aMetacelloMVRepositorySpecs collect: [:aSpec | aSpec createRepository ]
