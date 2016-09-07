tests
testGithubRepositoryPatternMatchingC
  self
    should: [ 
      MCGitHubRepository
        parseLocation: 'github://GsDevKit/Seaside31:v3.?.?/repository'
        version: nil ]
    raise: Error