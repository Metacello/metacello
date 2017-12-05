repository creation
createRepository: aRepositorySpec
  | url type |
  url := CypressUrl absoluteFromText: aRepositorySpec description.
  (url isKindOf: CypressAbstractFileUrl)
    ifTrue: [ ^ super createRepository: aRepositorySpec ].
  type := aRepositorySpec type.
  Smalltalk
    at: #'MCHttpRepository'
    ifPresent: [ :cl |  
      type = 'http'
        ifTrue: [ 
          ^ cl
            location: aRepositorySpec description
            user: aRepositorySpec username
            password: aRepositorySpec password ] ].
  Smalltalk
    at: #'MCDirectoryRepository'
    ifPresent: [ :cl |
      type = 'directory'
        ifTrue: [ 
          ^ cl new
            directory: (self fileHandleOn: aRepositorySpec description) ] ].
  Smalltalk
    at: #'MCFileTreeRepository'
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
  Smalltalk
    at: #'TonelRepository'
    ifPresent: [ :cl | 
      type = 'tonel'
        ifTrue: [ 
          | description headerSize |
          description := aRepositorySpec description.
          headerSize := 'tonel://' size.
          ^ cl new
            directory:
              (self
                fileHandleOn:
                  (aRepositorySpec description copyFrom: headerSize + 1 to: description size)) ] ].
  Smalltalk
    at: #'MCGitHubRepository'
    ifPresent: [ :cl | 
      type = 'github'
        ifTrue: [ ^ cl location: aRepositorySpec description ] ].
  Smalltalk
    at: #'MCBitbucketRepository'
    ifPresent: [ :cl | 
      type = 'bitbucket'
        ifTrue: [ ^ cl location: aRepositorySpec description ] ].
  Smalltalk
    at: #'MCGitoriousRepository'
    ifPresent: [ :cl | 
      type = 'gitorious'
        ifTrue: [ ^ cl location: aRepositorySpec description ] ].
  Smalltalk
    at: #'MCDictionaryRepository'
    ifPresent: [ :cl |
      type = 'dictionary'
        ifTrue: [ 
          | description headerSize globalName |
          description := aRepositorySpec description.
          headerSize := 'dictionary://' size.
          globalName := (description copyFrom: headerSize + 1 to: description size)
            asSymbol.
          ^ Smalltalk
            at: globalName
            ifAbsent: [ 
              Smalltalk
                at: globalName
                put:
                  (cl new
                    description: description;
                    yourself) ] ] ].
  ^ nil
