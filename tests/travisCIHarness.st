Transcript cr; show: 'travis---->travisCIHarness.st'.
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
                    fileStream
                        nextPutAll: '***********************************************';
                        lf.
                    fileStream
                        tab;
                        nextPutAll: 'Results for ' , suite name;
                        lf;
                        nextPutAll: result printString;
                        lf.
                    fileStream
                        nextPutAll: '***********************************************';
                        lf.
                    result failures notEmpty
                        ifTrue: [ 
                            fileStream
                                nextPutAll: '*** FAILURES ***';
                                nextPutAll: '****************';
                                lf ].
                    result failures
                        do: [ :each | 
                            fileStream tab
                                nextPutAll: each class name asString , ' debug: ' , each selector printString , '.';
                                lf ].
                    result errors notEmpty
                        ifTrue: [ 
                            fileStream
                                nextPutAll: '*** ERRORS ***';
                                nextPutAll: '****************';
                                lf ].
                    result errors
                        do: [ :each | 
                            fileStream tab
                                nextPutAll: each class name asString , ' debug: ' , each selector printString , '.';
                                lf ].
                    fileStream
                        nextPutAll: '***********************************************';
                        lf ]] ensure: [ 
            			(Transcript respondsTo: #close)
              				ifTrue: [
                				| stream |
                				stream := Transcript.
                				(Smalltalk globals associationAt: #'Transcript') value: (Smalltalk at: #'OLDTranscript').
                				stream close ]]]
