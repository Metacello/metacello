tests
testBitbucketRepositoryPatternMatchingA
  [ 
  | repo x |
  repo := MCBitbucketRepository
    parseLocation: 'bitbucket://dalehenrich/external:1.?/repository'
    version: nil.
  self assert: repo projectVersion = '1.0-beta.32Tests' ]
    on: Error
    do: [ :ex | 
      Transcript
        cr;
        show: 'testBitbucketRepositoryPatternMatchingA: ' , ex description;
        cr;
        show: (GsProcess stackReportToLevel: 100).
      ex pass ]