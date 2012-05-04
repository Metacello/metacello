deprecated
alternateEnsureMetacello
	"Use this method if the primary repository 'http://seaside.gemstone.com/ss/metacello' is inaccessible.
	 Secondary repository is valid for loading versions 1.0-beta.26 and later. "

	self deprecated: 'current version of #ensureMetacello automatically tries to load using alternate repository'.
	Smalltalk at: #MetacelloProject  ifAbsent: [  
		self ensureGoferVersion: 'Gofer-Core-lr.115'.
		Smalltalk at: #Gofer ifPresent: [:goferClass | | gofer version repo |
			gofer := goferClass new
				url: 'http://www.squeaksource.com/metacello';
				version: 'Metacello-Core-DaleHenrichs.348';
				version: 'Metacello-MC-DaleHenrichs.332';
				yourself.
			Smalltalk at: #SystemVersion ifPresent: [:cl | | versionString  |
				versionString := cl current version.
				(versionString beginsWith: 'Squeak3')
					ifTrue: [ gofer version: 'Metacello-Platform.squeak-dkh.5']].
			gofer load.
			"now load minimal installation from alternate repository"
			version := self project latestVersion.
			repo := MCHttpRepository 
				location: 'http://www.squeaksource.com/metacello' 
				user: '' 
				password: ''.
			(version repositoryOverrides: (Array with: (repo))) load ]]