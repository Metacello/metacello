tests
testProjectRecord
    | project version names loader |
    Transcript
        cr;
        show: 'testProjectRecord [0]'.
    self deny: (Smalltalk at: #'Metacello_Configuration_Test_DoIt_Result').
    Transcript
        cr;
        show: 'testProjectRecord [1]'.
    project := self project.
    version := project version: '3.0'.
    loader := version record.
    names := #('MetacelloTestConfigurationOfFoo' 'GoferFoo' 'GoferBar' 'GoferFaux' 'GoferBeau') asOrderedCollection.
    loader loadDirective
        packageDirectivesDo: [ :pkgDirective | 
            | name |
            name := pkgDirective packageName.
            Transcript
                cr;
                show: 'testProjectRecord [4]: ' , name.
            self assert: (names indexOf: name) = 1.
            Transcript
                cr;
                show: 'testProjectRecord [5]: ' , name.
            names remove: name ifAbsent: [ self assert: false ].
            Transcript
                cr;
                show: 'testProjectRecord [6]: ' , name ].
    Transcript
        cr;
        show: 'testProjectRecord [2]'.
    self deny: (Smalltalk at: #'Metacello_Configuration_Test_DoIt_Result').
    Transcript
        cr;
        show: 'testProjectRecord [3]'