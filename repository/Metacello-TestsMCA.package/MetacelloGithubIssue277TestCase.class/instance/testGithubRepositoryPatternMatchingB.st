tests
testGithubRepositoryPatternMatchingB
  self
    should: [ 
      MCGitHubRepository
        parseLocation: 'github://dalehenrich/nonexistent:v3.?/repository'
        version: nil ]
    raise: Error