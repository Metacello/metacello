tests
expectedFailures

  | versionString |
  Smalltalk
    at: #SystemVersion
    ifPresent: [ :cl |
      versionString := cl current version.
      versionString = 'Pharo4.0' 
        ifTrue: [ ^#( #testCommitNewPackageSpec ) ] ].
  ^super expectedFailures
