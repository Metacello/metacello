*metacello-monticello-platform
workingCopyFor: aPackageName ifNone: noneBlock
  ^ MCWorkingCopy allManagers
    detect: [ :wc | wc packageName = aPackageName ]
    ifNone: noneBlock