*metacello-monticello-platform
metacelloUnloadPackages: packageList
  | aGofer |
  aGofer := Gofer new.
  packageList
    do: [ :packageName | 
      (self workingCopyFor: packageName ifNone: [  ]) notNil
        ifTrue: [ aGofer package: packageName ] ].
  aGofer references notEmpty
    ifTrue: [ aGofer metacelloUnload ]