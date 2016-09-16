running
tearDown
  [ 
  super tearDown.
  self tearDownPackages.
  self tearDownRepositories ]
    ensure: [ MetacelloProjectRegistration registry: registry ]