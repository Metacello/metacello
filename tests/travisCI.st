| versionString gitPath repository version successFilename failFilename suite result resultsFileName |

[
versionString := '1.0-beta.31.1'.

"bootstrap FileTree"
Gofer new
    url: 'http://ss3.gemstone.com/ss/FileTree';
    package: 'ConfigurationOfFileTree';
    load.
((Smalltalk at: #ConfigurationOfFileTree) project version: '1.0') load.

"load Metacello from the git checkout"
gitPath := (FileDirectory default directoryNamed: 'git_cache') fullName.
repository := MCFileTreeRepository new 
  directory: (FileDirectory on: gitPath, 'metacello-work/repository');
  yourself.
Gofer new
  repository: repository;
  package: 'ConfigurationOfMetacello';
  load.
version := (Smalltalk at: #ConfigurationOfMetacello) project version: versionString.
version repositoryOverrides: {repository}.
version load: 'Tests'.

"Run the Metacello tests"
(Smalltalk at: #MetacelloPlatform) current authorName: 'testMonkey'. "These tests save code ... need an Author"
successFilename := 'TravisCISuccess.txt'.
failFilename := 'TravisCIFailure.txt'.
suite := TestCase suiteClass named: ' Metacello Test Suite'.
(version currentlyLoadedClassesInVersion
    select: [ :cl | cl inheritsFrom: TestCase ])
    do: [ :cl | 
        cl isAbstract
            ifFalse: [ suite addTest: cl buildSuiteFromSelectors ] ].
result := suite run.
resultsFileName := result defects isEmpty
    ifTrue: [ successFilename ]
    ifFalse: [ failFilename ].
FileDirectory default
    forceNewFileNamed: resultsFileName
    do: [ :fileStream | 
        fileStream lineEndConvention: #'lf'.
        fileStream
            nextPutAll: '***********************************************';
            cr.
        fileStream
            tab;
            nextPutAll: 'Results for ' , suite name;
            cr;
            nextPutAll: result printString;
            cr.
        fileStream
            nextPutAll: '***********************************************';
            cr.
        result failures notEmpty
            ifTrue: [ 
                fileStream
                    nextPutAll: '*** FAILURES ***';
                    nextPutAll: '****************';
                    cr ].
        result failures
            do: [ :each | 
                fileStream tab
                    nextPutAll: each class name asString , ' debug: ' , each selector printString , '.';
                    cr ].
        result errors notEmpty
            ifTrue: [ 
                fileStream
                    nextPutAll: '*** ERRORS ***';
                    nextPutAll: '****************';
                    cr ].
        result errors
            do: [ :each | 
                fileStream tab
                    nextPutAll: each class name asString , ' debug: ' , each selector printString , '.';
                    cr ].
        fileStream
            nextPutAll: '***********************************************';
            cr ] ]
    ensure: [ 
        | stream |
        stream := Transcript.
        (Smalltalk associationAt: #'Transcript') value: (Smalltalk at: #'OLDTranscript').
        stream close ].
