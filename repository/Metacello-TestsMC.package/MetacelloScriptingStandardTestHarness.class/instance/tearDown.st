running
tearDown
    super tearDown.
    self tearDownPackages.
    self tearDownRepositories.
    MetacelloProjectRegistration baselineRegistry: baselineRegistry.
    MetacelloProjectRegistration configurationRegistry: configurationRegistry