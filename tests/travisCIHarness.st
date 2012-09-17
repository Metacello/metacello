Smalltalk
        at: #'TravisCIHarness'
        put: [ :version :successFilename :failFilename | 
            [
            | suite result resultsFileName |
            suite := TestCase suiteClass named: version versionString printString, ' Test Suite'.
            (version currentlyLoadedClassesInVersion select: [ :cl | cl inheritsFrom: TestCase ]) 
                                do: [ :cl | 
                                    cl isAbstract
                                        ifFalse: [ suite addTest: cl buildSuiteFromSelectors ] ].
            result := suite run.
            resultsFileName := result defects isEmpty
                ifTrue: [ successFilename ]
                ifFalse: [ failFilename ].
            (Smalltalk at: #TravisResultFileBlock) 
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
                        cr ]] ensure: [ | stream |
                            stream := Transcript. 
                            (Smalltalk globals associationAt: #Transcript) value: (Smalltalk at: #OLDTranscript).
                            stream close ]]
