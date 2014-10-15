tests
testGithubRepositoryPatternMatchingD
  | repo |
  repo := MCGitHubRepository
    parseLocation: 'github://GsDevKit/Seaside31:v3.1.1.?/repository'
    version: nil.
  self assert: repo projectVersion = '3.1.1.3-gs31'