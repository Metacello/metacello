"Load the test configuration and #ensureMetacello"

| configName dirName dirPath |
[
configName := 'ConfigurationOfMetacelloConfigurationTest'.

dirName := 'mcz'.
dirPath := (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ ((Smalltalk at: #'FileSystem') workingDirectory / dirName) pathString ]
  ifNotNil: [:fileDirectoryClass | (fileDirectoryClass default directoryNamed: dirName ) fullName].

Gofer new
  repository: (MCDirectoryRepository new directory: dirPath);
  package: configName;
  load.

(Smalltalk at: configName asSymbol) perform: #ensureMetacello] 
  ensure: [ | stream |
    stream := Transcript.
    (Smalltalk associationAt: #Transcript) value: (Smalltalk at: #OLDTranscript).
    stream close ]

