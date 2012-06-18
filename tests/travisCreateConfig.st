"Create a sample configuration from MetacelloConfigTemplate, to test the ensureMetacello logic"
| configName configClass package |
configName := 'ConfigurationOfMetacelloConfigurationTest'.
configClass := MetacelloPlatform current 
	copyClass: MetacelloConfigTemplate 
	as: configName 
	inCategory: configName.
package := MCPackage named: configName.
Gofer new
  repository: (MCDirectoryRepository new directory: 
        (FileDirectory default directoryNamed:'mcz'));
  package: configName;
  commit: 'testing'.
