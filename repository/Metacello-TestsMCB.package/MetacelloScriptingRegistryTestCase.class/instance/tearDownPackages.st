running
tearDownPackages
  "yes ... we are running teardown twice ... there are two packages named External-Core loaded during these tests ... don't ask"

  | aGofer |
  super tearDownPackages.
  aGofer := Gofer new.
  self tearDownPackageList
    do: [ :packageName | 
      (self hasPackage: packageName)
        ifTrue: [ aGofer package: packageName ] ].
  aGofer references notEmpty
    ifTrue: [ aGofer metacelloUnload ]