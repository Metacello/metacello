tests
testBitbucketRepositoryPatternMatchingC
  self
    should: [ 
      MCBitbucketRepository
        parseLocation: 'bitbucket://dalehenrich/external:1.?.?/repository'
        version: nil ]
    raise: Error