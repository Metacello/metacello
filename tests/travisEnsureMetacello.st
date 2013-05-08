"Load the test configuration and #ensureMetacello"

| configName dirName dir |
[
configName := 'ConfigurationOfMetacelloConfigurationTest'.

dirName := 'mcz'.
dir := (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ (Smalltalk at: #'FileSystem') workingDirectory / dirName  ]
  ifNotNil: [:fileDirectoryClass | fileDirectoryClass default directoryNamed: dirName  ].

Gofer new
  repository: (MCDirectoryRepository new directory: dir);
  package: configName;
  load.

(Smalltalk at: configName asSymbol) perform: #ensureMetacello] 
  ensure: [ | stream |
    stream := Transcript.
    (Smalltalk associationAt: #Transcript) value: (Smalltalk at: #OLDTranscript).
    stream close ]

