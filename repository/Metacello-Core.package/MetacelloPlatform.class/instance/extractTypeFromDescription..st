repository creation
extractTypeFromDescription: description
  description == nil
    ifTrue: [ ^ nil ].
  (((description indexOfSubCollection: '/') = 1) or: [ description second = $: ])
    ifTrue: [ ^ 'directory' ].
  ((description indexOfSubCollection: 'dictionary://') = 1)
    ifTrue: [ ^ 'dictionary' ].
  ((description indexOfSubCollection: 'filetree://') = 1)
    ifTrue: [ ^ 'filetree' ].
  ((description indexOfSubCollection: 'github://') = 1)
    ifTrue: [ ^ 'github' ].
  ((description indexOfSubCollection: 'gitorious://') = 1)
    ifTrue: [ ^ 'gitorious' ].
  ((description indexOfSubCollection: 'bitbucket://') = 1)
    ifTrue: [ ^ 'bitbucket' ].
  ((description indexOfSubCollection: 'globalrepo:') = 1)
    ifTrue: [ ^ 'globalrepo' ].
  ^ 'http'
