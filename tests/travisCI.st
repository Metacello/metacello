"Load and run tests to be performed by TravisCI"
| gitPath |
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.

"Bootstrap FileTree"
Gofer new
  url: 'http://ss3.gemstone.com/ss/FileTree';
  package: 'ConfigurationOfFileTree';
  load.
((Smalltalk at: #'ConfigurationOfFileTree') project version: #stable)
  load.
Gofer new
  url: 'http://seaside.gemstone.com/ss/metacello';
  package: 'ConfigurationOfGofer';
  load.
((Smalltalk at: #'ConfigurationOfGofer') project version: #'stable')
  load.
metacelloConfigurationRepository := (Smalltalk at: #'MCFileTreeRepository') new
  directory: (FileDirectory on: gitPath, '/metacello-work/repository');
  yourself.

"Load Metacello-Base"
Gofer new
  repository: metacelloConfigurationRepository;
  package: 'Metacello-Base';
  load.

"Load the Metacello Tests ..."
(Smalltalk at: #Metacello) new
	baseline: 'Metacello';
  repository: 'filetree://', gitPath, '/metacello-work/repository';
  load: 'TravisCI'.


"Run the Metacello tests"
(Smalltalk at: #MetacelloPlatform) current authorName: 'testMonkey'. "These tests save code ... need an Author"

"no deprecated messages should be used"
(Deprecation respondsTo: #raiseWarning:)
  ifTrue: [ Deprecation raiseWarning: true].

[
MetacelloBuilderTravisCI 
  runHarnessFor:  #( 'BaselineOfMetacello' ) 
  successFilename: 'TravisCISuccess.txt' 
  failFilename: 'TravisCIFailure.txt'
]
        on: Deprecation
        do: [ :ex |
            "catch and throw Error ..."
            true ifTrue: [self error: 'DEPRECATION WARNNG: ', ex description printString ].
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

