"Load and run tests to be performed by TravisCI"
| gitPath |
Transcript cr; show: 'travis---->travisCI.st'.
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

Smalltalk at: #CommandLineToolSet ifPresent: [:cls |
  "make sure CommandLineToolSet is installed and registered for Squeak: Issue #151"
  Transcript 
    cr; show: 'CommandLineToolSet is installed ...'; 
    cr; show: 'ToolSet default: ', (Smalltalk at: #ToolSet) default printString.
  (Smalltalk at: #ToolSet) default: cls.
  Transcript cr; show: 'ToolSet default: ', (Smalltalk at: #ToolSet) default printString.
].

"Load the Metacello Tests ... "
[
Metacello new
	baseline: 'Metacello';
  repository: 'filetree://', gitPath, '/metacello-work/repository';
  get.

Metacello new
	baseline: 'Metacello';
  repository: 'filetree://', gitPath, '/metacello-work/repository';
  onConflict: [:ex | 
    "allow new version of Metacello to be loaded"
    ex existingProjectRegistration baseName = 'Metacello'
      ifTrue: [ ex allow ].
    ex disallow ];
  load: 'TravisCI'.
] on: Warning do: [:ex | 
  Transcript cr; show: 'WARNING: ', ex description.
  ex resume: true ].

"Run the Metacello tests"
MetacelloPlatform current authorName: 'testMonkey'. "These tests save code ... need an Author"

"no deprecated messages should be used"
(Deprecation respondsTo: #raiseWarning:)
  ifTrue: [ Deprecation raiseWarning: true].

Transcript cr; show: '---Start running tests...'.

[
TravisCIHarness
  value: #( 'BaselineOfMetacello' )
  value: 'TravisCISuccess.txt' 
  value: 'TravisCIFailure.txt'.
]
        on: Deprecation
        do: [ :ex |
            "catch and throw Error ..."
            true ifTrue: [nil error: 'DEPRECATION WARNNG: ', ex description printString ].
            "help for debugging Deprecation warnings"
            Transcript
                cr;
                show: '***Deprecation***************************************************';
                cr;
                show: ex description.
            (ex signalerContext stackOfSize: 100)
                do: [ :item | 
                    Transcript
                        cr;
                        show: item printString asString.
                    item tempScopedNames
                        doWithIndex: [ :title :index | 
                            Transcript
                                cr;
                                tab;
                                nextPutAll: title;
                                nextPut: $:;
                                space;
                                tab;
                                nextPutAll: (item tempAt: index) printString ].
                    Transcript
                        cr;
                        show: '***************************************************' ].
            ex resume].

