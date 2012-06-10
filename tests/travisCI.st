"Load and run tests to be performed by TravisCI"
| gitPath |
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"Load the Metacello Tests ... "
Metacello new
	baseline: 'Metacello';
  repository: 'filetree://', gitPath, '/metacello-work/repository';
  load: 'TravisCI'.


"Run the tests"
TravisCIHarness
  value: #( 'Metacello' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.

