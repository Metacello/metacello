"Load the #previewBoostrap version of Metacello ... 1.0-beta.32.1 or there abouts
 After loading #previewBootstrap, the actual Metacello Preview version can be loaded"
| gitCache metacelloDir metacelloConfigurationRepository version |

Transcript cr; show: 'travis---->previewBootstrap.st'.

gitCache := 'git_cache'.

metacelloDir := (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ (Smalltalk at: #'FileSystem') workingDirectory / gitCache / 'metacello-work' ]
  ifNotNil: [:fileDirectoryClass | 
    (fileDirectoryClass default directoryNamed: gitCache, '/metacello-work' ) ].

[
Gofer new
  url: 'http://ss3.gemtalksystems.com/ss/FileTree';
  package: 'ConfigurationOfFileTree';
  load.
((Smalltalk at: #'ConfigurationOfFileTree') project version: #'stable')
  load: 'default'.

metacelloConfigurationRepository := (Smalltalk at: #'MCFileTreeRepository') new
  directory: metacelloDir;
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
      (metacelloDir / 'tests' / 'travisCIHarness.st')
             readStreamDo: [ :fileStream | fileStream fileIn ] ]
    ifNotNil: [ :fileDirectoryClass |
      Transcript cr; show: 'notnil block'.
      (metacelloDir directoryNamed: 'tests')
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


