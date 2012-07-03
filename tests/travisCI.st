"Load and run tests to be performed by TravisCI"
| gitPath |
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"Load the Metacello Tests ... "
Metacello new
	baseline: 'Metacello';
  repository: 'filetree://', gitPath, '/metacello-work/repository';
  load: 'TravisCI'.


"Run the Metacello tests"
MetacelloPlatform current authorName: 'testMonkey'. "These tests save code ... need an Author"

"no deprecated messages should be used"
(Deprecation respondsTo: #raiseWarning:)
  ifTrue: [ Deprecation raiseWarning: true].

TravisCIHarness
  value: #( 'BaselineOfMetacello' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.

