"Load and run tests to be performed by TravisCI"
| gitCache gitPath |
Transcript cr; show: 'travis---->userGuide.st'.

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

[
Metacello new
	baseline: 'Metacello';
  repository: 'filetree://', gitPath, '/metacello-work/repository';
  onConflict: [:ex | 
    "allow new version of Metacello to be loaded"
    ex existingProjectRegistration baseName = 'Metacello'
      ifTrue: [ ex allow ].
    ex pass ];
  load: (Smalltalk at: #'TRAVIS_LOAD_LIST') ] 
    on: Warning 
    do: [:ex | 
      Transcript cr; show: 'WARNING: ', ex description.
      ex resume ].

Transcript cr; show: '---Start running documentation script..'.

Transcript cr; show: '---get'.
Metacello new
  configuration: 'Seaside30';
  smalltalkhubUser: 'Seaside' project: 'Seaside30';
  get.

false ifTrue: [ Gofer new
  package: 'ConfigurationOfGrease';
  url: 'http://www.squeaksource.com/MetacelloRepository';
  load ].

Transcript cr; show: '---load'.
Metacello registry
  configuration: 'Seaside30';
  version: #stable;
  onWarning: [:ex | 
    Transcript cr; show: 'WARNING: ', ex description.
    ex resume];
  load.
