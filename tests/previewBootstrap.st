"Load and run tests to be performed by TravisCI"
| gitPath metacelloConfigurationRepository version |
Transcript cr; show: 'travis---->previewBootstrap.st'.
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

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

((Smalltalk at: #'FileDirectory') on: gitPath, '/metacello-work/tests')
  fileNamed: 'travisCIHarness.st'
  do: [:fileStream | fileStream fileIn ].

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


