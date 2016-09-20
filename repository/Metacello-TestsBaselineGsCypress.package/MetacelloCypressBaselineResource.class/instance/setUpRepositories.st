running
setUpRepositories
  "self reset"

  super setUpRepositories.
  externalPackages := Dictionary new.
  alternatePackages := Dictionary new