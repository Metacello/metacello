git support
gitBranchNameFor: gitPath
  "return current branch for git repository located at <aDirectory>, if <aDirectory> is not a git repository, return nil"

  | command result |
  command := 'cd ' , gitPath , '; git rev-parse --abbrev-ref HEAD'.
  result := System performOnServer: command.
  ^ result trimBoth