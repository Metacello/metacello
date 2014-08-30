running
tearDown
  | aGofer finalWorkingCopyList diff |
  super tearDown.
  Smalltalk removeKey: self repositoryName ifAbsent: [  ].
  self tempRepositories
    do: [ :repo | MCRepositoryGroup default removeRepository: repo ].
  aGofer := Gofer new.
  self tearDownPackageNames
    do: [ :pName | 
      (self hasPackage: pName)
        ifTrue: [ aGofer package: pName ] ].
  aGofer references notEmpty
    ifTrue: [ aGofer metacelloUnload ].
  finalWorkingCopyList := (MCWorkingCopy allManagers
    collect: [ :each | each packageName ]) asIdentitySet.
  diff := finalWorkingCopyList - initialWorkingCopyList.
  diff
    do: [ :leak | 
      Transcript
        cr;
        show:
            'leaked package from ' , self printString , ' -> ' , leak printString ].
  self assert: diff isEmpty