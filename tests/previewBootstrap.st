"Load and run tests to be performed by TravisCI"
| gitCache metacelloWork metacelloConfigurationRepository version travisCIHarnessScript |
Transcript cr; show: 'travis---->previewBootstrap.st'.
gitCache := MetacelloPlatform current directoryFromPath: 'git_cache' relativeTo: MetacelloPlatform current defaultDirectory.
metacelloWork := MetacelloPlatform current directoryFromPath: 'metacello-work' relativeTo: gitCache.

[
Gofer new
  url: 'http://ss3.gemstone.com/ss/FileTree';
  package: 'ConfigurationOfFileTree';
  load.
((Smalltalk at: #'ConfigurationOfFileTree') project version: '1.0')
  load: 'default'.
Gofer new
  url: 'http://seaside.gemstone.com/ss/metacello';
  package: 'ConfigurationOfGofer';
  load.
((Smalltalk at: #'ConfigurationOfGofer') project version: #'stable')
  load.
metacelloConfigurationRepository := (Smalltalk at: #'MCFileTreeRepository') new
  directory: metacelloWork;
  yourself.
Gofer new
  repository: metacelloConfigurationRepository;
  package: 'ConfigurationOfMetacello';
  load.
(version := (Smalltalk at: #'ConfigurationOfMetacello') project version: #previewBootstrap)
  load: 'TravisCI'.

"Run the Metacello tests"
(Smalltalk at: #MetacelloPlatform) current authorName: 'testMonkey'. "These tests save code ... need an Author"

testsDir := MetacelloPlatform current directoryFromPath: 'tests' relativeTo: metacelloWork.
travisCIHarnessScript := MetacelloPlatform current fileFromPath: 'travisCIHarness.st' relativeTo: testsDir.
MetacelloPlatform current readStreamOn: travisCIHarnessScript do: [:fileStream | fileStream fileIn].

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


