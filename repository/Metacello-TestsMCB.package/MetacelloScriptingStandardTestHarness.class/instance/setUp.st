running
setUp
  super setUp.
  registry := MetacelloProjectRegistration registry.
  self setUpRepositories.
  self setUpRepositoryContents.
  MetacelloProjectRegistration resetRegistry.
  initialWorkingCopyList := (MCWorkingCopy allManagers
    collect: [ :each | each packageName ]) asIdentitySet