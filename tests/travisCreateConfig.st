"Create a sample configuration from MetacelloConfigTemplate, to test the ensureMetacello logic"
| configName configClass package dirName dir |
configName := 'ConfigurationOfMetacelloConfigurationTest'.
configClass := MetacelloPlatform current 
	copyClass: MetacelloConfigTemplate 
	as: configName 
	inCategory: configName.
package := MCPackage named: configName.

dirName := 'mcz'.
dir := (Smalltalk at: #'FileDirectory' ifAbsent: [  ])
  ifNil: [ (Smalltalk at: #'FileSystem') workingDirectory / dirName  ]
  ifNotNil: [:fileDirectoryClass | fileDirectoryClass default directoryNamed: dirName ].

Gofer new
  repository: (MCDirectoryRepository new directory: dir);
  package: configName;
  commit: 'testing'.
