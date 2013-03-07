"Loading the preview, should be a simulation of the standard bootstrap
after Metacello-Base has been loaded ... which is what the test harndess
does"
| gitPath |
Transcript cr; show: 'travis---->travisPreviewCI.st'.
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"Load Metacello-Base, so that Metacello is bootstrapped"
MetacelloBuilderTravisCI fileIn: 'Metacello-Base.st'.

"Load the Metacello Tests ... "
Metacello new
  configuration: 'MetacelloPreview';
  version: #stable;
  repository: 'filetree://', gitPath, '/metacello-work';
  load: 'TravisCI'.


"Run the Metacello tests"
(Smalltalk at: #MetacelloPlatform) current authorName: 'testMonkey'. "These tests save code ... need an Author"

MetacelloBuilderTravisCI 
  runHarnessFor:  #( 'BaselineOfMetacello' ) 
  successFilename: 'TravisCISuccess.txt' 
  failFilename: 'TravisCIFailure.txt'

