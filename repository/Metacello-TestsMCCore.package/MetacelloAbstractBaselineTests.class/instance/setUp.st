running
setUp
  super setUp.
  MetacelloPlatform current clearPackageCache.
  self setUpRepositories.
  self setUpRepositoryContents.
  registry := MetacelloProjectRegistration registry.
  MetacelloProjectRegistration resetRegistry