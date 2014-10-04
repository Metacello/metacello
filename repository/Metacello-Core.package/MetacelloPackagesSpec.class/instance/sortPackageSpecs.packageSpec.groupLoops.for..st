private
sortPackageSpecs: orderedSpecs packageSpec: packageSpec groupLoops: groupLoops for: aVersionSpec
  | packageIndex moved movePackage targetPackage targetIndex targetSpecNames groupLoopDetected |
  packageIndex := orderedSpecs indexOf: packageSpec.
  moved := movePackage := false.
  targetSpecNames := packageSpec
    requiredSpecNamesForPackageOrdering: aVersionSpec.
  groupLoopDetected := groupLoops includes: packageSpec.
  groupLoopDetected
    ifFalse: [ 
      targetSpecNames
        do: [ :targetPackageOrProjectName | 
          targetPackage := orderedSpecs
            detect: [ :each | each name = targetPackageOrProjectName ]
            ifNone: [ 
              self
                error:
                  'project or package named: ' , targetPackageOrProjectName printString
                    , ' not found.' ].
          targetIndex := orderedSpecs indexOf: targetPackage.
          (groupLoopDetected not and: [ packageIndex = targetIndex ])
            ifTrue: [ 
              self
                notify:
                  'A group loop has been detected. The package: ' , packageSpec name printString
                    ,
                      ' requires a group that includes itself. If you resume, the group loop will be ignored and details will be written to the Transcript.'.
              groupLoopDetected := true.
              groupLoops add: packageSpec ].
          movePackage := movePackage or: [ packageIndex < targetIndex ].
          false
            ifTrue: [ 
              "use for debugging non-obvious reference loops"
              packageIndex < targetIndex
                ifTrue: [ 
                  Transcript
                    cr;
                    show:
                        'Moving ' , targetPackageOrProjectName , ' from ' , targetIndex printString
                            , ' to ' , packageIndex printString ] ] ] ].
  groupLoopDetected
    ifTrue: [ 
      "old implementation that does not resolve group names"
      targetSpecNames := packageSpec requires.
      targetSpecNames
        do: [ :targetPackageName | 
          targetPackage := orderedSpecs
            detect: [ :each | each name = targetPackageName ]
            ifNone: [  ].
          targetIndex := orderedSpecs indexOf: targetPackage.
          movePackage := movePackage or: [ packageIndex <= targetIndex ] ] ].
  movePackage
    ifTrue: [ 
      moved := true.
      orderedSpecs
        remove: packageSpec
        ifAbsent: [ ^ self error: 'unexpected error removing package' ].
      targetIndex := 0.
      targetSpecNames
        do: [ :targetPackageOrProjectName | 
          (targetPackage := orderedSpecs
            detect: [ :each | each name = targetPackageOrProjectName ]
            ifNone: [  ]) ~~ nil
            ifTrue: [ targetIndex := targetIndex max: (orderedSpecs indexOf: targetPackage) ] ].
      targetIndex == 0
        ifTrue: [ orderedSpecs add: packageSpec beforeIndex: packageIndex ]
        ifFalse: [ orderedSpecs add: packageSpec afterIndex: targetIndex ] ].
  ^ moved