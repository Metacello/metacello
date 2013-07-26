"Load and run tests to be performed by TravisCI"
| gitCache gitPath |
Transcript cr; show: 'travis---->travisCI.st'.

gitCache := 'git_cache'.
gitPath := (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ ((Smalltalk at: #'FileSystem') workingDirectory / gitCache) pathString ]
  ifNotNil: [:fileDirectoryClass | (fileDirectoryClass default directoryNamed: gitCache ) fullName].

Smalltalk at: #CommandLineToolSet ifPresent: [:cls |
  "make sure CommandLineToolSet is installed and registered for Squeak: Issue #151"
  (Smalltalk at: #ToolSet) default: cls.
].

"Load Metacello ... "

Metacello new
	baseline: 'Metacello';
  repository: 'filetree://', gitPath, '/metacello-work/repository';
  get.

Metacello new
	baseline: 'Metacello';
  repository: 'filetree://', gitPath, '/metacello-work/repository';
  onWarning: [:ex |
    Transcript cr; show: 'WARNING: ', ex description.
    ex resume ];
  onConflict: [:ex | ex allow ];
  load: (Smalltalk at: #'TRAVIS_LOAD_LIST').

Transcript cr; show: '---Start running documentation script..'.

Transcript cr; show: '---list'.
Metacello new
  configuration: [:spec | spec name beginsWith: 'Seaside'];
  ss3: 'MetaRepoForPharo20';
  list.

Transcript cr; show: '---get'.
Metacello new
  configuration: 'Seaside30';
  ss3: 'MetaRepoForPharo20';
  get.

Transcript cr; show: '---lock'.
Metacello new
  configuration: 'Seaside30';
  version: #stable;
  smalltalkhubUser: 'Seaside' project: 'Seaside30';
  lock.

Transcript cr; show: '---load'.
Metacello registry
  configuration: 'Seaside30';
  load.
