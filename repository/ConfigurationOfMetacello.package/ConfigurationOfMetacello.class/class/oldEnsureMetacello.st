deprecated
oldEnsureMetacello
	"original implementation of ensureMetacello, just in case problems surface."

	self deprecated: 'use #ensureMetacello instead'.
	Smalltalk at: #MetacelloProject  ifAbsent: [  
		self ensureGoferVersion: 'Gofer-Core-lr.115'.
		Smalltalk at: #Gofer ifPresent: [:goferClass | | gofer |
			gofer := goferClass new
				url: 'http://seaside.gemstone.com/ss/metacello';
				version: 'Metacello-Core-DaleHenrichs.348';
				version: 'Metacello-MC-DaleHenrichs.332';
				yourself.
			Smalltalk at: #SystemVersion ifPresent: [:cl | | versionString |
				versionString := cl current version.
				(versionString beginsWith: 'Squeak3')
					ifTrue: [ gofer version: 'Metacello-Platform.squeak-dkh.5']].
			gofer load.
			"now load minimal installation"
			self load ]]