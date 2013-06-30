"Load and run tests to be performed by TravisCI"
| gitCache gitPath metacelloConfigurationRepository version |
Transcript cr; show: 'travis---->previewBootstrap.st'.

gitCache := 'git_cache'.
gitPath := (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ ((Smalltalk at: #'FileSystem') workingDirectory / gitCache) pathString ]
  ifNotNil: [:fileDirectoryClass | (fileDirectoryClass default directoryNamed: gitCache ) fullName].

[
Gofer new
  url: 'http://ss3.gemtalksystems.com/ss/FileTree';
  package: 'ConfigurationOfFileTree';
  load.
((Smalltalk at: #'ConfigurationOfFileTree') project version: #'stable')
  load: 'default'.
Gofer new
  url: 'http://seaside.gemtalksystems.com/ss/metacello';
  package: 'ConfigurationOfGofer';
  load.
((Smalltalk at: #'ConfigurationOfGofer') project version: #'stable')
  load.
metacelloConfigurationRepository := (Smalltalk at: #'MCFileTreeRepository') new
  directory: (FileDirectory on: gitPath, '/metacello-work');
  yourself.
Gofer new
  repository: metacelloConfigurationRepository;
  package: 'ConfigurationOfMetacello';
  load.
(version := (Smalltalk at: #'ConfigurationOfMetacello') project version: #'previewBootstrap')
  load: 'TravisCI'.

"Run the Metacello tests"
(Smalltalk at: #MetacelloPlatform) current authorName: 'testMonkey'. "These tests save code ... need an Author"

(Smalltalk at: #'FileDirectory' ifAbsent: [  ])
    ifNil: [ 
      (((Smalltalk at: #'FileSystem') perform: #workingDirectory) / 
           'metacello-work' / 'tests' / 'travisCIHarness.st' )
             readStreamDo: [ :fileStream | fileStream fileIn ] ]
    ifNotNil: [ :fileDirectoryClass |
      ((Smalltalk at: #'FileDirectory') on: gitPath, '/metacello-work/tests')
          fileNamed: 'travisCIHarness.st'
          do: [:fileStream | fileStream fileIn ] ].

Transcript cr; show: 'Starting tests------'.

(Smalltalk at: #TravisCIHarness)
  value: version
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.
]
	on: Warning
	do: [:ex |
		Transcript cr; show: 'Warning: ', ex description.
		ex resume: true].


