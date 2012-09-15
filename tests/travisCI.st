"Load and run tests to be performed by TravisCI"
| gitPath metacelloConfigurationRepository version |
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

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
  directory: (FileDirectory on: gitPath);
  yourself.
Gofer new
  repository: metacelloConfigurationRepository;
  package: 'ConfigurationOfMetacello';
  load.
(version := (Smalltalk at: #'ConfigurationOfMetacello') project version: #stable)
  load: 'TravisCI'.

"Run the Metacello tests"
MetacelloPlatform current authorName: 'testMonkey'. "These tests save code ... need an Author"

((Smalltalk at: #'FileDirectory') on: gitPath, '/metacello-work/tests')
  fileNamed: 'travisCIHarness.st'
  do: [:fileStream | fileStream fileIn ].

(Smalltalk at: #TravisCIHarness)
  value: version
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.

