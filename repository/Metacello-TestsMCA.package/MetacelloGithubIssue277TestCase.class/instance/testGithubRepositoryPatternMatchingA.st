tests
testGithubRepositoryPatternMatchingA
  "may not pass for long"

  | repo |
  repo := MCGitHubRepository
    parseLocation: 'github://GsDevKit/Seaside31:v3.?/repository'
    version: nil.
  self assert: repo projectVersion = '3.1.3.1-gs'