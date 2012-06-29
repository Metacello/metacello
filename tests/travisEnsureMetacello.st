"Load the test configuration and #ensureMetacello"

| configName |
[
(Deprecation respondsTo: #raiseWarning:)
  ifTrue: [ Deprecation raiseWarning: false ].

"Unconditionally route Transcript output to TravisTranscript.txt ... projects can choose whether or not to display"
FileDirectory default
  fileNamed: 'FileStream-show.st'
  do: [:fileStream | fileStream fileIn ].
Smalltalk at: #OLDTranscript put: Transcript.
(Smalltalk associationAt: #Transcript) value: (FileDirectory default newFileNamed: 'TravisTranscript.txt').
Transcript file lineEndConvention: #'lf'.


configName := 'ConfigurationOfMetacelloConfigurationTest'.

Gofer new
  repository: (MCDirectoryRepository new directory: 
        (FileDirectory default directoryNamed:'mcz'));
  package: configName;
  load.

(Smalltalk at: configName asSymbol) perform: #ensureMetacello] 
  ensure: [ | stream |
    stream := Transcript.
    (Smalltalk associationAt: #Transcript) value: (Smalltalk at: #OLDTranscript).
    stream close ]

