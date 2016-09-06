running
tearDownPackages
  "yes ... we are running teardown twice ... there are two packages named External-Core loaded during these tests ... don't ask"

  super tearDownPackages.
  MetacelloPlatform current metacelloUnloadPackages: self tearDownPackageList