repository creation
createRepository: aRepositorySpec
  | type headerSize description |
  type := aRepositorySpec type.
  type = 'directory'
    ifTrue: [ 
      ^ MCServerDirectoryRepository new
        directory: (ServerFileDirectory on: aRepositorySpec description) ].
  type = 'clientDirectory'
    ifTrue: [ 
      headerSize := 'client://' size.
      description := aRepositorySpec description.
      ^ MCDirectoryRepository new
        directory:
          (ClientFileDirectory
            on: (description copyFrom: headerSize + 1 to: description size)) ].
  type = 'serverDirectory'
    ifTrue: [ 
      headerSize := 'server://' size.
      description := aRepositorySpec description.
      ^ MCServerDirectoryRepository new
        directory:
          (ServerFileDirectory
            on: (description copyFrom: headerSize + 1 to: description size)) ].
  type = 'cache'
    ifTrue: [ 
      | description headerSize atLocation oop |
      description := aRepositorySpec description.
      headerSize := 'cache://' size.
      atLocation := description indexOf: $@.
      oop := (description copyFrom: headerSize + 1 to: atLocation - 1) asNumber.
      ^ Object _objectForOop: oop ].
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
              (ServerFileDirectory
                on:
                  (aRepositorySpec description copyFrom: headerSize + 1 to: description size)) ] ].
  ^ super createRepository: aRepositorySpec