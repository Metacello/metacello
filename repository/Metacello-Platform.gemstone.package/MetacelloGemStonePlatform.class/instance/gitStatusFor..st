git support
gitStatusFor: gitPath
  "answer emtpy string if repo has not been modified"

  | command result |
  command := 'cd ' , gitPath , '; git status --porcelain'.
  result := System performOnServer: command.
  (result beginsWith: 'fatal:')
    ifTrue: [ ^ nil ].
  ^ result