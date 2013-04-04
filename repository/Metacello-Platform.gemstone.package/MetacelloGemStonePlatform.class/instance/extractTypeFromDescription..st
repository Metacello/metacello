repository creation
extractTypeFromDescription: description
  description == nil
    ifTrue: [ ^ nil ].
  (description beginsWith: 'client://')
    ifTrue: [ ^ 'clientDirectory' ].
  (description beginsWith: 'server://')
    ifTrue: [ ^ 'serverDirectory' ].
  (description beginsWith: 'cache://')
    ifTrue: [ ^ 'cache' ].
  ^ super extractTypeFromDescription: description