git support
gitCommitShaFor: gitPath
  "return SHA for git repository located at <aDirectory>, if <aDirectory> is not a git repository, return nil"

  | command result |
  command := 'cd ' , gitPath , '; git log -1 --pretty=format:%h'.
  result := System performOnServer: command.
  (result beginsWith: 'fatal:')
    ifTrue: [ ^ nil ].
  ^ result trimWhiteSpace