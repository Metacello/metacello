| gitPath fileInBlock |
Transcript cr; show: 'travis---->travisFetch.st'.

gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

Transcript cr; show: gitPath printString.

(Smalltalk at: #FileDirectory ifAbsent: [])
  ifNil: [ 
    fileInBlock := [:fileName | 
      ((Smalltalk at: #FileSystem) workingDirectory / 'metacello-work' / 'tests' / fileName)
        readStreamDo: [:fileStream | fileStream fileIn ] ] ]
  ifNotNil: [:fileDirectoryClass | 
    fileInBlock := [:fileName |
Transcript cr; show: 'start fileIn: ', fileName printString.
      (fileDirectoryClass on: gitPath, '/metacello-work/tests')
        fileNamed: fileName
        do: [:fileStream | fileStream fileIn ].
Transcript cr; show: 'finished...' ] ].

fileInBlock value: 'MetacelloFetcher.st'.

(Smalltalk at: #MetacelloTravisCI) fetch.
