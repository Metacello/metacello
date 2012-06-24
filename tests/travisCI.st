"Load and run tests to be performed by TravisCI"
| gitPath |
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"Load the Metacello Tests ... "
Metacello new
	configuration: 'Metacello';
  vesion: '1.0-beta.32';
  repository: 'filetree://', gitPath, '/metacello-work/repository';
  load: 'Tests'.


"Run the Metacello tests"
MetacelloPlatform current authorName: 'testMonkey'. "These tests save code ... need an Author"

TravisCIHarness
  value: #( 'ConfigurationOfMetacello' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.

