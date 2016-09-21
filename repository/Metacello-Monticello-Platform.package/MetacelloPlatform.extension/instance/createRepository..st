*metacello-monticello-platform
createRepository: aRepositorySpec
  | type |
  type := aRepositorySpec type.
  type = 'http'
    ifTrue: [ 
      self
        globalNamed: #'MCHttpRepository'
        ifPresent: [ :cl | 
          ^ cl
            location: aRepositorySpec description
            user: aRepositorySpec username
            password: aRepositorySpec password ] ].
  type = 'directory'
    ifTrue: [ 
      self
        globalNamed: #'MCDirectoryRepository'
        ifPresent: [ :cl | ^ cl new directory: (self fileHandleOn: aRepositorySpec description) ] ].
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
              ((self globalNamed: #'MCDictionaryRepository') new
                description: description;
                yourself) ] ].
  type = 'globalrepo'
    ifTrue: [ 
      | url |
      "primarily used for testing"
      url := aRepositorySpec description asUrl.
      ^ self repositoryFromUrl: (self globalNamed: url locator) asUrl ].
  ^ nil