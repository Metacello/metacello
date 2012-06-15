running
setUp
    super setUp.
    baselineRegistry := MetacelloProjectRegistration baselineRegistry.
    configurationRegistry := MetacelloProjectRegistration configurationRegistry.
    self setUpRepositories.
    self setUpRepositoryContents.
    MetacelloProjectRegistration resetRegistry