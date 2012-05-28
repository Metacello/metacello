running
setUp
    super setUp.
    projectRegistry := MetacelloProjectRegistration registry.
    self setUpRepositories.
    self setUpRepositoryContents.
    MetacelloProjectRegistration resetRegistry