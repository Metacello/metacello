tests
testGithubRepositoryPatternMatchingD
  self
    should: [ 
      MCGitHubRepository
        parseLocation: 'github://GsDevKit/Seaside31:v30.?/repository'
        version: nil ]
    raise: Error