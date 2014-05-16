git support
gitRootDirectoryPath: directoryPath
  "answer true if the given path is within a git repository"

  | gitPath |
  gitPath := System
    performOnServer: 'cd ' , directoryPath , '; git rev-parse --show-toplevel'.
  (gitPath beginsWith: 'fatal:')
    ifTrue: [ ^ self error: 'not a git directory' ].
  ^ gitPath