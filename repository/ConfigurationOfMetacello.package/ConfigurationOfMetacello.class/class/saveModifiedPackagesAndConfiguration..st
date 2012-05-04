development support
saveModifiedPackagesAndConfiguration: commitMessage
	"Save modified mcz files, update and then save the configuration."

	"self saveModifiedPackagesAndConfiguration: '- fixed bug'"

	"Note that Metacello 1.0-beta.28 is needed and is currently unstable and in development"

	<apiDocumentation>
	self ensureMetacello.
	(Smalltalk at: #MetacelloToolBox) saveModifiedPackagesAndConfigurationIn: self description: commitMessage