running
tearDown
  | aGofer finalWorkingCopyList diff |
  super tearDown.
  aGofer := Gofer new.
  self tearDownPackages: aGofer.
  aGofer references notEmpty
    ifTrue: [ aGofer metacelloUnload ].
  MetacelloPlatform current
    removeGlobalNamed: #'Metacello_Gofer_Test_Repository'
    ifAbsent: [  ].
  MetacelloPlatform current
    removeGlobalNamed: #'Metacello_Configuration_Test_Repository'
    ifAbsent: [  ].
  MetacelloPlatform current
    removeGlobalNamed: #'Metacello_Configuration_Test_Alternate_Repository'
    ifAbsent: [  ].
  self tempRepositories
    do: [ :repo | MCRepositoryGroup default removeIdenticalRepository: repo ].
  MetacelloPlatform current reenableUndefinedSybolUpdates: undefinedSymbols.
  finalWorkingCopyList := MCWorkingCopy allManagers
    collect: [ :each | each packageName ].
  diff := finalWorkingCopyList difference: initialWorkingCopyList.
  diff
    do: [ :leak | 
      Transcript
        cr;
        show:
            'leaked package from ' , self printString , ' -> ' , leak printString ].
  self assert: diff isEmpty