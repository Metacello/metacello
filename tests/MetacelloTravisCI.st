'From Pharo1.4 of 18 April 2012 [Latest update: #14457] on 4 September 2012 at 4:33:29 pm'!
Object subclass: #MetacelloTravisCI
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'XXX'!

!MetacelloTravisCI methodsFor: 'public' stamp: 'dkh 9/4/2012 22:42'!
test
    [ 
    | repository version |
    [
    self loadFileTree.
    repository := (Smalltalk at: #'MCFileTreeRepository') new
        directory: self metacelloRepositoryDirectory;
        yourself.
    version := self
        loadMetacello: [ :aVersion :loads | aVersion load: loads ]
        metacelloConfigurationRepository: repository]
      on: Warning
      do: [:ex |
            Transcript cr; show: 'Warning: ', ex description.
            ex resume: true].
    self runTestFor: version ]
        ensure: [ 
            | stream |
            stream := Transcript.
            (Smalltalk globals associationAt: #'Transcript') value: (Smalltalk at: #'OLDTranscript').
            stream close ]! !


!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 9/1/2012 11:10'!
failFilename
    ^ 'TravisCIFailure.txt'! !

!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 9/1/2012 14:54'!
gitPath
    ^ (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
        ifNil: [ 
            "Pharo-2.x"
            (((Smalltalk at: #'FileSystem') perform: #workingDirectory) / 'git_cache') pathString ]
        ifNotNil: [ :fileDirectoryClass | 
            "Pharo-1.x"
            (fileDirectoryClass default directoryNamed: 'git_cache') fullName ]! !

!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 9/4/2012 16:31'!
loadFileTree
    | version |
    self
        retry: [ 
            Gofer new
                url: 'http://ss3.gemtalksystems.com/ss/FileTree';
                package: 'ConfigurationOfFileTree';
                load ].
    version := (Smalltalk at: #'ConfigurationOfFileTree') project version: #'stable'.
    version load: 'default'.
    self
        retry: [ 
            Gofer new
                url: 'http://seaside.gemtalksystems.com/ss/metacello';
                package: 'ConfigurationOfGofer';
                load ].
    version := (Smalltalk at: #'ConfigurationOfGofer') project version: #'stable'.
    version load: 'Tests'! !

!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 9/4/2012 16:32'!
loadMetacello: loadBlock metacelloConfigurationRepository: metacelloConfigurationRepository
    | version repositories |
    self
        retry: [ 
            Gofer new
                disablePackageCache;
                repository: metacelloConfigurationRepository;
                package: 'ConfigurationOfMetacello';
                load ].
    version := (Smalltalk at: #'ConfigurationOfMetacello') project version: #'stable'.
    repositories := (#('http://www.squeaksource.com/MetacelloRepository')
        collect: [ :url | MCHttpRepository location: url user: '' password: '' ]) asSet.
    repositories add: metacelloConfigurationRepository.
    version repositoryOverrides: repositories.
    loadBlock
        value: version
        value:
            #('Metacello-ToolBox' 'Metacello-TestsCore' 'Metacello-TestsTutorial' 'Metacello-TestsMC' 'Metacello-TestsReference').
    ^ version! !

!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 9/1/2012 16:20'!
metacelloRepositoryDirectory
    ^(Smalltalk at: #'FileDirectory' ifAbsent: [  ])
        ifNil: [ 
            "Pharo-2.x"
            ((Smalltalk at: #'FileSystem') perform: #workingDirectory) / 'git_cache' / 'metacello-work' / 'repository' ]
        ifNotNil: [ :fileDirectoryClass | 
            "Pharo-1.x"
            fileDirectoryClass default directoryNamed: 'git_cache/metacello-work/repository' ]! !

!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 9/4/2012 16:32'!
retry: aBlock
    self retry: aBlock retryCount: 3! !

!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 9/4/2012 16:31'!
retry: aBlock retryCount: retryCount
    | count |
    count := 1.
    [ true ]
        whileTrue: [ 
            [ 
            aBlock value.
            ^ self ]
                on: Error
                do: [ :ex | 
                    count < retryCount
                        ifTrue: [ 
                            Transcript
                                cr;
                                show: 'RETRYING AFTER:';
                                cr;
                                show: ex description printString ]
                        ifFalse: [ 
                            Transcript
                                cr;
                                show: 'FAILED RETRYING:';
                                cr;
                                show: ex description printString.
                            ex pass ] ].
            count := count + 1 ]! !

!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 7/3/2013 15:43'!
resultFileBlock
  ^ (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [
    [ :resFileName :streamBlock |
    (Smalltalk at: #'FileSystem') workingDirectory / resFileName
      writeStreamDo: streamBlock ] ]
  ifNotNil: [ :fileDirectoryClass |
    [ :resFileName :streamBlock |
      fileDirectoryClass default forceNewFileNamed: resFileName do: streamBlock ] ]! !

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
    self resultFileBlock
      value: resultsFileName
      value: [ :fileStream | 
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

!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 9/2/2012 12:10'!
signIn
    (Smalltalk at: #'MetacelloPlatform') current authorName: 'testMonkey'! !

!MetacelloTravisCI methodsFor: 'private' stamp: 'dkh 9/1/2012 11:10'!
successFilename
    ^ 'TravisCISuccess.txt'! !

