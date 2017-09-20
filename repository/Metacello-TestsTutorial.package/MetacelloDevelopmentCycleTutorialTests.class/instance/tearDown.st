running
tearDown
  | aGofer |
  super tearDown.
  aGofer := Gofer new.
  self tearDownPackages: aGofer.
  aGofer references notEmpty
    ifTrue: [ aGofer metacelloUnload ].
  Smalltalk globals removeKey: self repositoryName ifAbsent: [  ].
  Smalltalk globals removeKey: self alternatRepositoryName ifAbsent: [  ].
  Smalltalk globals removeKey: #'Metacello_Gofer_Test_Repository' ifAbsent: [  ].
  Smalltalk globals removeKey: #'Metacello_Configuration_Test_Repository' ifAbsent: [  ].
  Smalltalk globals at: self configurationName ifPresent: [ :cl | cl removeFromSystem ].
  self tempRepositories
    do: [ :repo | MCRepositoryGroup default removeIdenticalRepository: repo ].
  (self hasPackage: self configurationName asString)
    ifTrue: [ 
      Gofer new
        package: self configurationName asString;
        metacelloUnload ].
  MetacelloPlatform current authorName: authorName