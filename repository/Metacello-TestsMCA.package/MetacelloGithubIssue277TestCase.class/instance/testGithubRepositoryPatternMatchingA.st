tests
testGithubRepositoryPatternMatchingA
  "may not pass for long"

  | repo |
  [ 
  repo := MCGitHubRepository
    parseLocation: 'github://GsDevKit/Seaside31:v3.1.3?/repository'
    version: nil.
  self assert: repo projectVersion = 'v3.1.3.1-gs' ]
    on: Error
    do: [ :ex | 
      "keep an eye out for rate limiting errors from github for anonymous api usage"
      Transcript
        cr;
        show: 'testGithubRepositoryPatternMatchingA: ' , ex description.
      (MetacelloPlatform current
        string: ex description
        includesSubstring: 'API rate limit exceeded')
        ifFalse: [ 
          "don't fail test because github rate limit exceeded"
          ex pass ] ]