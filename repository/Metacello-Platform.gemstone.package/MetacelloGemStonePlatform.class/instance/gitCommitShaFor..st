git support
gitCommitShaFor: gitRepoDirectory
  "return SHA for git repository located at <aDirectory>, if <aDirectory> is not a git repository, return nil"

  | command gitPath result |
  gitPath := gitRepoDirectory fullName.
  command := 'cd ' , gitPath , '; git log -1 --pretty=format:%h'.
  result := System performOnServer: command.
  result = 'fatal:'
    ifTrue: [ ^ nil ].
  ^ result trimBoth