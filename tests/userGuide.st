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

  MetacelloProjectRegistration registry baselineRegistry values
    do: [ :registration |
      Transcript cr; show: registraion printString.
      registration projectName
        ifNil: [ Transcript show: ' - no name: ']
        ifNotNil: [
          registration configurationProjectSpec
            ifNil: [ registration baselineProjectSpec ifNil: [Transcript show: ' - nil config and nil baseline: ' ] ]
            ifNotNil: [ registration baselineProjectSpec ifNotNil: [Transcript show: ' - nonNil config and nonNil baseline' ] ] ].

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

"Run smattering of expressions used in Metacello User Guide ... 
 not all expressions are implemented yet...
 We just want these expressions to run without error"

Transcript cr; show: '---Start running documentation script..'.

Transcript cr; show: '---get (default)'.
Metacello new
  configuration: 'Seaside30';
  get.

Transcript cr; show: '---get'.
Metacello new
  configuration: 'Seaside3';
  smalltalkhubUser: 'Seaside' project: 'MetacelloConfigurations';
  get.

Transcript cr; show: '---load'.
Metacello registry
  configuration: 'Seaside30';
  version: #stable;
  onWarning: [:ex | 
    Transcript cr; show: 'WARNING: ', ex description.
    ex resume];
  onUpgrade: [:ex | ex allow ];
  load.

Transcript cr; show: '---list'.
Metacello registry
  configuration: #('Seaside30' 'MetacelloPreview');
  list.

Metacello new
  configuration: [:spec | spec name beginsWith: 'Seaside'];
  smalltalkhubUser: 'Seaside' project: 'Seaside30';
  list.

false ifTrue: [
  "no longer interested in locking configurations"
Transcript cr; show: '---lock'.
Metacello image
  configuration: 'Seaside30';
  version: #'stable';
  lock.
].

Metacello new
  configuration: 'SeasideRest';
  onWarning: [:ex | 
    Transcript cr; show: 'Warning: ', ex description.
    ex resume ];
  repository: 'http://smalltalkhub.com/mc/Seaside/MetacelloConfigurations/main';
  load.

TravisCISuccessNoFailure
      value: 'TravisCISuccess.txt'.
