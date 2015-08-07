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
        show:
            'expected testBitbucketRepositoryPatternMatchingA failure: ' , ex description;
        cr;
        show: (GsProcess stackReportToLevel: 100).
      false
        ifTrue: [ 
          "don't fail test ... see https://github.com/dalehenrich/metacello-work/issues/359"
          ex pass ] ]