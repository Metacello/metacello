*metacello-mc
createRepository: aRepositorySpec
  | type |
  type := aRepositorySpec type.
  type = 'http'
    ifTrue: [ 
      ^ MCHttpRepository
        location: aRepositorySpec description
        user: aRepositorySpec username
        password: aRepositorySpec password ].
  type = 'directory'
    ifTrue: [ 
      ^ MCDirectoryRepository new
        directory: (self fileHandleOn: aRepositorySpec description) ].
  self
    globalNamed: #'MCFileTreeRepository'
    ifPresent: [ :cl | 
      type = 'filetree'
        ifTrue: [ 
          | description headerSize |
          description := aRepositorySpec description.
          headerSize := 'filetree://' size.
          ^ cl new
            directory:
              (self
                fileHandleOn:
                  (aRepositorySpec description copyFrom: headerSize + 1 to: description size)) ] ].
  self
    globalNamed: #'MCGitHubRepository'
    ifPresent: [ :cl | 
      type = 'github'
        ifTrue: [ ^ cl location: aRepositorySpec description ] ].
  self
    globalNamed: #'MCBitbucketRepository'
    ifPresent: [ :cl | 
      type = 'bitbucket'
        ifTrue: [ ^ cl location: aRepositorySpec description ] ].
  self
    globalNamed: #'MCGitoriousRepository'
    ifPresent: [ :cl | 
      type = 'gitorious'
        ifTrue: [ ^ cl location: aRepositorySpec description ] ].
  type = 'dictionary'
    ifTrue: [ 
      | description headerSize globalName |
      description := aRepositorySpec description.
      headerSize := 'dictionary://' size.
      globalName := (description copyFrom: headerSize + 1 to: description size)
        asSymbol.
      ^ self
        globalNamed: globalName
        ifAbsent: [ 
          self
            globalNamed: globalName
            put:
              (MCDictionaryRepository new
                description: description;
                yourself) ] ].
  ^ nil