"make sure that we use the #previewBootstrap symbolic version is functional"
| gitPath |
Transcript cr; show: 'travis---->previewBootstrap.st'.
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"Load the Metacello Tests ... "
Metacello new
  configuration: 'Metacello';
  version: #previewBootstrap;
  repository: 'filetree://', gitPath, '/metacello-work';
  load: 'TravisCI'.


"Run the Metacello tests"
(Smalltalk at: #MetacelloPlatform) current authorName: 'testMonkey'. "These tests save code ... need an Author"

MetacelloBuilderTravisCI 
  runHarnessFor:  #( 'BaselineOfMetacello' ) 
  successFilename: 'TravisCISuccess.txt' 
  failFilename: 'TravisCIFailure.txt'

