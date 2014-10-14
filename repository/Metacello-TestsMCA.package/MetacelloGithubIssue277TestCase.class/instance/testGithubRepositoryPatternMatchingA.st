tests
testGithubRepositoryPatternMatchingA
  | repo x |
  true
    ifTrue: [ 
      "waiting for https://github.com/dalehenrich/metacello-work/issues/300 to be resolved"
      ^ self ].
  repo := MCGitHubRepository
    parseLocation: 'github://GsDevKit/Seaside31:v3.1.3-gs/repository'
    version: nil.
  repo directory.	"force download ... no errors"
  self assert: (x := repo repositoryVersionString) = 'c740380'