running
setUp
  | repo |
  super setUp.
  MetacelloPlatform current clearPackageCache.
  repo := MetacelloIssue108Resource current monticelloRepository.
  self tempRepositories add: repo.
  Smalltalk at: self repositoryName put: repo.
  initialWorkingCopyList := MetacelloPlatform current workingCopyNames