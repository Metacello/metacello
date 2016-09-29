running
setUpRepositories
  "self reset"

  super setUpRepositories.
  externalPackages := CypressDictionaryRepository on: Dictionary new.
  alternatePackages := CypressDictionaryRepository on: Dictionary new