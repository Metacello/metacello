tests
testGithubRepositoryPatternMatchingB
  | repo x |
  true
    ifTrue: [ 
      "waiting for https://github.com/dalehenrich/metacello-work/issues/300 to be resolved"
      ^ self ].
  repo := MCGitHubRepository
    parseLocation: 'github://dalehenrich/external:1.0-beta.32Tests/repository'
    version: nil.
  repo directory.	"force download ... no errors"
  self assert: (x := repo repositoryVersionString) = '3f9b964'