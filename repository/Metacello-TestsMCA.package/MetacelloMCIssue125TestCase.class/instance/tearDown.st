running
tearDown
  | finalWorkingCopyList diff |
  super tearDown.
  MetacelloPlatform current
    metacelloUnloadPackages: self tearDownPackageNames;
    cleanUpRepositoryGroupRemoving:
        (MetacelloPlatform current
            globalNamed: #'Metacello_Gofer_Test_Repository'
            ifAbsent: [  ]);
    cleanUpRepositoryGroupRemoving:
        (MetacelloPlatform current
            globalNamed: #'Metacello_Configuration_Test_Repository'
            ifAbsent: [  ]);
    yourself.
  MetacelloPlatform current
    removeGlobalNamed: #'Metacello_Gofer_Test_Repository'
    ifAbsent: [  ].
  MetacelloPlatform current
    removeGlobalNamed: #'Metacello_Configuration_Test_Repository'
    ifAbsent: [  ].
  finalWorkingCopyList := MetacelloPlatform current workingCopyNames.
  diff := finalWorkingCopyList difference: initialWorkingCopyList.
  diff
    do: [ :leak | 
      Transcript
        cr;
        show:
            'leaked package from ' , self printString , ' -> ' , leak printString ].
  self assert: diff isEmpty