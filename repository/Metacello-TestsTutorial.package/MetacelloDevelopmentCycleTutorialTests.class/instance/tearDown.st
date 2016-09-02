running
tearDown
  | aGofer |
  super tearDown.
  aGofer := Gofer new.
  self tearDownPackages: aGofer.
  aGofer references notEmpty
    ifTrue: [ aGofer metacelloUnload ].
  MetacelloPlatform current
    removeGlobalNamed: self repositoryName
    ifAbsent: [  ].
  MetacelloPlatform current
    removeGlobalNamed: self alternatRepositoryName
    ifAbsent: [  ].
  MetacelloPlatform current
    removeGlobalNamed: #'Metacello_Gofer_Test_Repository'
    ifAbsent: [  ].
  MetacelloPlatform current
    removeGlobalNamed: #'Metacello_Configuration_Test_Repository'
    ifAbsent: [  ].
  MetacelloPlatform current
    globalNamed: self configurationName
    ifPresent: [ :cl | cl removeFromSystem ].
  self tempRepositories
    do: [ :repo | MCRepositoryGroup default removeIdenticalRepository: repo ].
  (self hasPackage: self configurationName asString)
    ifTrue: [ 
      Gofer new
        package: self configurationName asString;
        metacelloUnload ].
  MetacelloPlatform current authorName: authorName