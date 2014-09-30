github/bitbucket support
processPID
  "return pid of process as string if available"

  ^ (System gemVersionReport at: 'processId') printString