tests
testBitbucketRepositoryPatternMatchingB
  self
    should: [ 
      MCBitbucketRepository
        parseLocation: 'bitbucket://dalehenrich/nonexistent:1.?/repository'
        version: nil ]
    raise: Error