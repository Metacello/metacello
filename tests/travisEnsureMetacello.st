"Load the test configuration and #ensureMetacello"

| configName |
[
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

