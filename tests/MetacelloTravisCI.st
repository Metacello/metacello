'From Pharo1.4 of 18 April 2012 [Latest update: #14457] on 2 September 2012 at 10:48:59 am'!
Object subclass: #MetacelloTravisCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'XXX'!

!MetacelloTravisCI methodsFor: 'public' stamp: 'dkh 9/2/2012 10:15'!
fetch
    [ 
    | cacheRepository repository cacheDirectory |
    cacheDirectory := self cacheRepositoryDirectory.
    cacheDirectory assureExistence.
    cacheRepository := MCDirectoryRepository new directory: cacheDirectory.
    self loadFileTree.
    repository := (Smalltalk at: #'MCFileTreeRepository') new
        directory: self metacelloRepositoryDirectory;
        yourself.
    self
        loadMetacello: [ :version :loads | 
            version cacheRepository: cacheRepository.
            version fetch: loads ]
        metacelloConfigurationRepository: repository.
    self signIn.
    (Smalltalk at: #'Gofer') new
        repository: cacheRepository;
        package: 'ConfigurationOfMetacello';
        commit: 'stash'.
    Transcript
        cr;
        show: 'DONE' ]
        ensure: [ 
            | stream |
            stream := Transcript.
            (Smalltalk associationAt: #'Transcript') value: (Smalltalk at: #'OLDTranscript').
            stream close ]! !

!MetacelloTravisCI methodsFor: 'public' stamp: 'dkh 9/2/2012 09:40'!
test
    | cacheRepository version |
    [ 
    cacheRepository := MCDirectoryRepository new directory: self cacheRepositoryDirectory.
    self loadFileTree.
    version := self
        loadMetacello: [ :aVersion :loads | 
            aVersion repositoryOverrides: {cacheRepository}.
            aVersion load: loads ]
        metacelloConfigurationRepository: cacheRepository.
    self runTestFor: version ]
        ensure: [ 
            | stream |
            stream := Transcript.
            (Smalltalk associationAt: #'Transcript') value: (Smalltalk at: #'OLDTranscript').
            stream close ]! !


!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 9/2/2012 09:39'!
cacheRepositoryDirectory
    ^ FileDirectory default directoryNamed: 'mcz'! !

!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 9/1/2012 11:10'!
failFilename
    ^ 'TravisCIFailure.txt'! !

!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 9/1/2012 14:54'!
gitPath
    ^ (FileDirectory default directoryNamed: 'git_cache') fullName! !

!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 9/1/2012 15:28'!
loadFileTree
    | versionString version |
    versionString := #'stable'.
    Gofer new
        url: 'http://ss3.gemstone.com/ss/FileTree';
        package: 'ConfigurationOfFileTree';
        load.
    version := (Smalltalk at: #'ConfigurationOfFileTree') project version: '1.0'.
    version load: 'default'.
    Gofer new
        url: 'http://seaside.gemstone.com/ss/metacello';
        package: 'ConfigurationOfGofer';
        load.
    version := (Smalltalk at: #'ConfigurationOfGofer') project version: #'stable'.
    version load: 'Tests'! !

!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 9/2/2012 10:48'!
loadMetacello: loadBlock metacelloConfigurationRepository: metacelloConfigurationRepository
    | versionString version |
    versionString := #'stable'.
    Gofer new
        disablePackageCache;
        repository: metacelloConfigurationRepository;
        package: 'ConfigurationOfMetacello';
        load.
    version := (Smalltalk at: #'ConfigurationOfMetacello') project version: versionString.
    version
        ignoreImage: true;
        repositoryOverrides: {metacelloConfigurationRepository}.
    loadBlock
        value: version
        value:
            #('Metacello-ToolBox' 'Metacello-TestsCore' 'Metacello-TestsTutorial' 'Metacello-TestsMC' 'Metacello-TestsReference').
    ^ version! !

!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 9/1/2012 16:20'!
metacelloRepositoryDirectory
    ^ FileDirectory on: self gitPath , '/metacello-work/repository'! !

!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 9/2/2012 10:01'!
runTestFor: version
    | cacheRepository successFilename failFilename suite result resultsFileName |
    self signIn.
    successFilename := self successFilename.
    failFilename := self failFilename.
    suite := TestCase suiteClass named: ' Metacello Test Suite'.
    (version currentlyLoadedClassesInVersion select: [ :cl | cl inheritsFrom: TestCase ])
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
                cr ]! !

!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 9/2/2012 10:01'!
signIn
    (Smalltalk at: #'MetacelloPlatform') current authorName: 'testMonkey'! !

!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 9/1/2012 11:10'!
successFilename
    ^ 'TravisCISuccess.txt'! !

