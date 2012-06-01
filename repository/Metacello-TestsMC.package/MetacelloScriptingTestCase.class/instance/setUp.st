running
setUp
    super setUp.
    projectRegistry := MetacelloProjectRegistration registry.
    projectSpecRegistry := MetacelloProjectRegistration projectSpecRegistry.
    self setUpRepositories.
    self setUpRepositoryContents.
    MetacelloProjectRegistration resetRegistry