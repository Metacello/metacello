accessing
directory
  directory
    ifNil: [
      directory := self
        projectDirectoryFrom: self projectPath
        version: self projectVersion.
      self repoPath isEmpty
        ifFalse: [ 
          directory := MetacelloPlatform current
            directoryFromPath: (self repoPath copy replaceAll: $/ with: MCFileTreeFileDirectoryUtils pathNameDelimiter)
            relativeTo: directory ] ]
    ifNotNil: [ 
      (MCFileTreeFileUtils current directoryExists: directory)
        ifFalse: [ 
          self flushCache.
          ^ self directory ] ].
  
  repositoryReader ifNotNil: [repositoryReader directory: directory].
  ^ directory