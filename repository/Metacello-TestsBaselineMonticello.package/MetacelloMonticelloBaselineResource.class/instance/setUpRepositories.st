running
setUpRepositories
  "self reset"

  super setUpRepositories.
  externalPackages := MCDictionaryRepository new.
  alternatePackages := MCDictionaryRepository new