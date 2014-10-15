tests
testBitbucketRepositoryPatternMatchingA
  | repo x |
  repo := MCBitbucketRepository
    parseLocation: 'bitbucket://dalehenrich/external:1.?/repository'
    version: nil.
  self assert: repo projectVersion = '1.0-beta.32Tests'