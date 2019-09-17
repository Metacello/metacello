tests
testBitbucketRepositoryPatternMatchingA
  "
UserDefinedError: Error accessing tags for bitbucket project: 'dalehenrich/external' -> 'Resource removed' :: 'This API is no longer supported.

For information about its removal, please refer to the deprecation notice at: https://developer.atlassian.com/cloud/bitbucket/deprecation-notice-v1-apis/'
"

  true
    ifTrue: [ ^ self ].
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
            'expected testBitbucketRepositoryPatternMatchingA failure: ' , ex description.
      false
        ifTrue: [ 
          "don't fail test ... see https://github.com/dalehenrich/metacello-work/issues/359"
          ex pass ] ]