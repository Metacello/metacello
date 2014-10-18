tests
testBitbucketRepositoryPatternMatchingD
  self
    should: [ 
      MCBitbucketRepository
        parseLocation: 'bitbucket://dalehenrich/external:10.?/repository'
        version: nil ]
    raise: Error