git support
gitBranchNameFor: gitRepoDirectory
  "return current branch for git repository located at <aDirectory>, if <aDirectory> is not a git repository, return nil"

  | command gitPath result |
  gitPath := gitRepoDirectory fullName.
  command := 'cd ' , gitPath , '; git rev-parse --abbrev-ref HEAD'.
  result := System performOnServer: command.
  result = 'fatal:'
    ifTrue: [ ^ nil ].
  ^ result trimBoth