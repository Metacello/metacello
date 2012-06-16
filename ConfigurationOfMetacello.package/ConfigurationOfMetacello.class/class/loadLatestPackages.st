development support
loadLatestPackages
	"self loadLatestPackages"

	"Note that Metacello 1.0-beta.28 is needed and is currently unstable and in development"

	| project |
	project := self project.
	^(project latestVersion: #baseline) load: #( 'default' 'Metacello-Tutorial')