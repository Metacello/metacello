running
setUp
  super setUp.
  self resourceClass current clearPackageCache.
  self setUpRepositories.
  self setUpRepositoryContents.
  registry := MetacelloProjectRegistration registry.
  MetacelloProjectRegistration resetRegistry