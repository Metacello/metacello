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

  "Issue #212: cannot repair registry from a Metacello load ... registry is copied during load, so any invalid registrations
   are restored immediately after load is finished"

  (MetacelloProjectRegistration registry baselineRegistry values
    detect: [ :registration | 
      "inline MetacelloProjectRegistration>>isValid to correct invalid definition ... detecting INVALID registrations"
      registration projectName
        ifNil: [ true ]
        ifNotNil: [ 
          registration configurationProjectSpec
            ifNil: [ registration baselineProjectSpec isNil ]
            ifNotNil: [ registration baselineProjectSpec notNil ] ] ]
    ifNone: [ "no invalid registrations, don't reset and prime" ])
      ifNotNil: [
        Transcript
          cr;
          show:
              'priming registry from image. See https://github.com/dalehenrich/metacello-work/issues/197'.
        [ 
        MetacelloProjectRegistration
          resetRegistry;
          primeRegistryFromImage ]
          on: Warning
          do: [ :ex | 
            Transcript
              cr;
              show: 'Warning resumed: ' , ex description.
            ex resume ] ].

"Load Metacello ... "

Metacello new
  baseline: 'Metacello';
  repository: 'filetree://', gitPath, '/metacello-work/repository';
  get.
Metacello new
  baseline: 'Metacello';
  repository: 'filetree://', gitPath, '/metacello-work/repository';
  lock.

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

Smalltalk at: #ConfigurationOfGLASS ifPresent: [:ignored |
  "On GemStone need to upgrade Grease to survive Seaside loads"
  Gofer new
    package: 'GsUpgrader-Core';
    url: 'http://ss3.gemtalksystems.com/ss/gsUpgrader';
    load.
  (Smalltalk at: #GsUpgrader) upgradeGrease.
].

"Run smattering of expressions used in Metacello User Guide ... 
 not all expressions are implemented yet...
 We just want these expressions to run without error"
[
Transcript cr; show: '---Start running documentation script..'.

"Loading"
Transcript cr; show: '---get (default)'.
Metacello new
  configuration: 'Seaside3';
  get.

Transcript cr; show: '---load (default)'.
  Metacello new
    configuration: 'Seaside3';
    load.

Transcript cr; show: '---load'.
Metacello registry
  configuration: 'Seaside3';
  version: #stable;
  onConflict: [:ex | ex allow ];
  smalltalkhubUser: 'Seaside' project: 'MetacelloConfigurations';
  get;
  load.

"Listing"
Transcript cr; show: '---list (1)'.
Metacello image
  configuration: [:spec | true ];
  list.

Transcript cr; show: '---list (2)'.
Metacello registry
  configuration: #('Seaside3' 'MetacelloPreview');
  list.

Metacello new
  configuration: [:spec | spec name beginsWith: 'Seaside'];
  smalltalkhubUser: 'Seaside' project: 'Seaside31';
  list.

"Getting"
Transcript cr; show: '---get (image)'.
Metacello image
  configuration: 'Seaside3';
  get.

Transcript cr; show: '---get (image 2)'.
Metacello image
  configuration: 'Seaside3';
  smalltalkhubUser: 'Seaside' project: 'MetacelloConfigurations';
  get.

Transcript cr; show: '---get (Magritte3)'.
Metacello image
  configuration: 'Magritte3';
  repository: 'http://smalltalkhub.com/mc/Magritte/Magritte3/main';
  get.

"Load the new version"
Transcript cr; show: '---load (Seaside3)'.
Metacello image
  configuration: 'Seaside3';
  version: #stable;
  load.

Transcript cr; show: '---load (Magritte3)'.
Metacello image
  configuration: 'Seaside3';
  lock. "lock to preserve currently loaded Seaside..."

Metacello registry
  configuration: 'Magritte';
  version: #stable;
  load.

"Locking"
Transcript cr; show: '---lock'.
Metacello image
  configuration: 'Seaside3';
  lock.

Transcript cr; show: '---lock (3.1.2)'.
Metacello image
  configuration: 'Seaside3';
  version: '3.1.2';
  lock.

Transcript cr; show: '---lock warning'.
Metacello registry
  configuration: 'Magritte3';
  onWarning: [:ex | 
    Transcript cr; show: 'Warning: ', ex description.
    ex resume ];
  load.

Transcript cr; show: '---lock tracking'.
Metacello registry
  configuration: 'Magritte3';
  onLock: [:ex :existing :new | 
    Transcript cr; show: 'Locked project: ', existing projectName printString.
    ex pass ];
  load.

Transcript cr; show: '---lock breaking'.
Metacello registry
  configuration: 'Magritte3';
  onLock: [:ex :existing :new | 
    existing baseName = 'Seaside3'
      ifTrue: [ ex break ].
    ex pass ];
  load.

"upgrading a locked project"
Transcript cr; show: '---lock upgrading'.
Metacello image
  configuration: 'Seaside3';
  version: '3.1.2';
  lock.

"locking example"

] 
  on: Warning
  do: [:ex | 
    Transcript cr; show: ex description.
    ex resume ].

TravisCISuccessNoFailure
      value: 'TravisCISuccess.txt'.
