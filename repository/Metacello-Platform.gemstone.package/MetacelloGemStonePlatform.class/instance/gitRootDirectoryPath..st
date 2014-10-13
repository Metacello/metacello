git support
gitRootDirectoryPath: directoryPath
  "answer root git directory from the given directoryPath"

  | gitPath |
  gitPath := System
    performOnServer: 'cd ' , directoryPath , '; git rev-parse --show-toplevel'.
  (gitPath beginsWith: 'fatal:')
    ifTrue: [ ^ self error: 'not a git directory' ].
  ^ gitPath trimWhiteSpace